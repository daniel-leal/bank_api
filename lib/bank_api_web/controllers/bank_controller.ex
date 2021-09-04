defmodule BankApiWeb.BankController do
  use BankApiWeb, :controller

  alias BankApi.Catalog
  alias BankApi.Catalog.Bank

  action_fallback BankApiWeb.FallbackController

  def index(conn, _params) do
    banks = Catalog.list_banks()
    render(conn, "index.json", banks: banks)
  end

  def create(conn, %{"bank" => bank_params}) do
    with {:ok, %Bank{} = bank} <- Catalog.create_bank(bank_params) do
      conn
      |> put_status(:created)
      |> render("show.json", bank: bank)
    end
  end

  def show(conn, %{"id" => id}) do
    bank = Catalog.get_bank!(id)
    render(conn, "show.json", bank: bank)
  end

  def update(conn, %{"id" => id, "bank" => bank_params}) do
    bank = Catalog.get_bank!(id)

    with {:ok, %Bank{} = bank} <- Catalog.update_bank(bank, bank_params) do
      render(conn, "show.json", bank: bank)
    end
  end

  def delete(conn, %{"id" => id}) do
    bank = Catalog.get_bank!(id)

    with {:ok, %Bank{}} <- Catalog.delete_bank(bank) do
      send_resp(conn, :no_content, "")
    end
  end
end
