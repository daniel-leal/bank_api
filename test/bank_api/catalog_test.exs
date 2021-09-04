defmodule BankApi.CatalogTest do
  use BankApi.DataCase

  alias BankApi.Catalog

  describe "banks" do
    alias BankApi.Catalog.Bank

    @valid_attrs %{code: "some code", name: "some name"}
    @update_attrs %{code: "some updated code", name: "some updated name"}
    @invalid_attrs %{code: nil, name: nil}

    def bank_fixture(attrs \\ %{}) do
      {:ok, bank} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_bank()

      bank
    end

    test "list_banks/0 returns all banks" do
      bank = bank_fixture()
      assert Catalog.list_banks() == [bank]
    end

    test "get_bank!/1 returns the bank with given id" do
      bank = bank_fixture()
      assert Catalog.get_bank!(bank.id) == bank
    end

    test "create_bank/1 with valid data creates a bank" do
      assert {:ok, %Bank{} = bank} = Catalog.create_bank(@valid_attrs)
      assert bank.code == "some code"
      assert bank.name == "some name"
    end

    test "create_bank/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_bank(@invalid_attrs)
    end

    test "update_bank/2 with valid data updates the bank" do
      bank = bank_fixture()
      assert {:ok, %Bank{} = bank} = Catalog.update_bank(bank, @update_attrs)
      assert bank.code == "some updated code"
      assert bank.name == "some updated name"
    end

    test "update_bank/2 with invalid data returns error changeset" do
      bank = bank_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_bank(bank, @invalid_attrs)
      assert bank == Catalog.get_bank!(bank.id)
    end

    test "delete_bank/1 deletes the bank" do
      bank = bank_fixture()
      assert {:ok, %Bank{}} = Catalog.delete_bank(bank)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_bank!(bank.id) end
    end

    test "change_bank/1 returns a bank changeset" do
      bank = bank_fixture()
      assert %Ecto.Changeset{} = Catalog.change_bank(bank)
    end
  end

  describe "branches" do
    alias BankApi.Catalog.Branch

    @valid_attrs %{address: "some address", district: "some district", name: "some name", number: "some number", phone: "some phone", postal_code: "some postal_code"}
    @update_attrs %{address: "some updated address", district: "some updated district", name: "some updated name", number: "some updated number", phone: "some updated phone", postal_code: "some updated postal_code"}
    @invalid_attrs %{address: nil, district: nil, name: nil, number: nil, phone: nil, postal_code: nil}

    def branch_fixture(attrs \\ %{}) do
      {:ok, branch} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_branch()

      branch
    end

    test "list_branches/0 returns all branches" do
      branch = branch_fixture()
      assert Catalog.list_branches() == [branch]
    end

    test "get_branch!/1 returns the branch with given id" do
      branch = branch_fixture()
      assert Catalog.get_branch!(branch.id) == branch
    end

    test "create_branch/1 with valid data creates a branch" do
      assert {:ok, %Branch{} = branch} = Catalog.create_branch(@valid_attrs)
      assert branch.address == "some address"
      assert branch.district == "some district"
      assert branch.name == "some name"
      assert branch.number == "some number"
      assert branch.phone == "some phone"
      assert branch.postal_code == "some postal_code"
    end

    test "create_branch/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_branch(@invalid_attrs)
    end

    test "update_branch/2 with valid data updates the branch" do
      branch = branch_fixture()
      assert {:ok, %Branch{} = branch} = Catalog.update_branch(branch, @update_attrs)
      assert branch.address == "some updated address"
      assert branch.district == "some updated district"
      assert branch.name == "some updated name"
      assert branch.number == "some updated number"
      assert branch.phone == "some updated phone"
      assert branch.postal_code == "some updated postal_code"
    end

    test "update_branch/2 with invalid data returns error changeset" do
      branch = branch_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_branch(branch, @invalid_attrs)
      assert branch == Catalog.get_branch!(branch.id)
    end

    test "delete_branch/1 deletes the branch" do
      branch = branch_fixture()
      assert {:ok, %Branch{}} = Catalog.delete_branch(branch)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_branch!(branch.id) end
    end

    test "change_branch/1 returns a branch changeset" do
      branch = branch_fixture()
      assert %Ecto.Changeset{} = Catalog.change_branch(branch)
    end
  end
end
