defmodule BankApiWeb.BankControllerTest do
  use BankApiWeb.ConnCase

  alias BankApi.Catalog
  alias BankApi.Catalog.Bank

  @create_attrs %{
    code: "some code",
    name: "some name"
  }
  @update_attrs %{
    code: "some updated code",
    name: "some updated name"
  }
  @invalid_attrs %{code: nil, name: nil}

  def fixture(:bank) do
    {:ok, bank} = Catalog.create_bank(@create_attrs)
    bank
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all banks", %{conn: conn} do
      conn = get(conn, Routes.bank_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create bank" do
    test "renders bank when data is valid", %{conn: conn} do
      conn = post(conn, Routes.bank_path(conn, :create), bank: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.bank_path(conn, :show, id))

      assert %{
               "id" => id,
               "code" => "some code",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.bank_path(conn, :create), bank: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update bank" do
    setup [:create_bank]

    test "renders bank when data is valid", %{conn: conn, bank: %Bank{id: id} = bank} do
      conn = put(conn, Routes.bank_path(conn, :update, bank), bank: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.bank_path(conn, :show, id))

      assert %{
               "id" => id,
               "code" => "some updated code",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, bank: bank} do
      conn = put(conn, Routes.bank_path(conn, :update, bank), bank: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete bank" do
    setup [:create_bank]

    test "deletes chosen bank", %{conn: conn, bank: bank} do
      conn = delete(conn, Routes.bank_path(conn, :delete, bank))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.bank_path(conn, :show, bank))
      end
    end
  end

  defp create_bank(_) do
    bank = fixture(:bank)
    %{bank: bank}
  end
end
