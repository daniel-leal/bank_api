defmodule BankApiWeb.BranchController do
  use BankApiWeb, :controller

  alias BankApi.Catalog
  alias BankApi.Catalog.Branch

  action_fallback BankApiWeb.FallbackController

  def index(conn, %{"bank_id" => bank_id, "latitude" => latitude, "longitude" => longitude}) do
    {latitude, _} = Float.parse(latitude)
    {longitude, _} = Float.parse(longitude)

    user_location = %Geo.Point{
      coordinates: {latitude, longitude},
      srid: 4326
    }

    branches = Catalog.list_branches_by_distance(bank_id, user_location)

    IO.inspect(branches)

    render(conn, "index.json", branches: branches)
  end

  def create(conn, %{"branch" => branch_params, "bank_id" => bank_id}) do
    create_branch_params = Map.put(branch_params, "bank_id", bank_id)

    with {:ok, %Branch{} = branch} <- Catalog.create_branch(create_branch_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.bank_branch_path(conn, :show, bank_id, branch))
      |> render("show.json", branch: branch)
    end
  end

  def show(conn, %{"id" => id, "bank_id" => bank_id}) do
    branch = Catalog.get_branch!(bank_id, id)
    render(conn, "show.json", branch: branch)
  end

  def update(conn, %{"id" => id, "bank_id" => bank_id, "branch" => branch_params}) do
    branch = Catalog.get_branch!(bank_id, id)

    with {:ok, %Branch{} = branch} <- Catalog.update_branch(branch, branch_params) do
      render(conn, "show.json", branch: branch)
    end
  end

  def delete(conn, %{"id" => id, "bank_id" => bank_id}) do
    branch = Catalog.get_branch!(bank_id, id)

    with {:ok, %Branch{}} <- Catalog.delete_branch(branch) do
      send_resp(conn, :no_content, "")
    end
  end
end
