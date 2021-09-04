defmodule BankApi.Catalog do
  @moduledoc """
  The Catalog context.
  """

  import Ecto.Query, warn: false
  alias BankApi.Repo

  alias BankApi.Catalog.Bank

  @doc """
  Returns the list of banks.

  ## Examples

      iex> list_banks()
      [%Bank{}, ...]

  """
  def list_banks do
    Repo.all(Bank)
  end

  @doc """
  Gets a single bank.

  Raises `Ecto.NoResultsError` if the Bank does not exist.

  ## Examples

      iex> get_bank!(123)
      %Bank{}

      iex> get_bank!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bank!(id) do
    Repo.get!(Bank, id)
    |> Repo.preload(:branches)
  end

  @doc """
  Creates a bank.

  ## Examples

      iex> create_bank(%{field: value})
      {:ok, %Bank{}}

      iex> create_bank(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bank(attrs \\ %{}) do
    %Bank{}
    |> Bank.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bank.

  ## Examples

      iex> update_bank(bank, %{field: new_value})
      {:ok, %Bank{}}

      iex> update_bank(bank, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bank(%Bank{} = bank, attrs) do
    bank
    |> Bank.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bank.

  ## Examples

      iex> delete_bank(bank)
      {:ok, %Bank{}}

      iex> delete_bank(bank)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bank(%Bank{} = bank) do
    Repo.delete(bank)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bank changes.

  ## Examples

      iex> change_bank(bank)
      %Ecto.Changeset{data: %Bank{}}

  """
  def change_bank(%Bank{} = bank, attrs \\ %{}) do
    Bank.changeset(bank, attrs)
  end

  alias BankApi.Catalog.Branch

  @doc """
  Returns the list of branches.

  ## Examples

      iex> list_branches()
      [%Branch{}, ...]

  """
  def list_branches(bank_id) do
    Branch
    |> where([b], b.bank_id == ^bank_id)
    |> Repo.all()
  end

  @doc """
  Gets a single branch.

  Raises `Ecto.NoResultsError` if the Branch does not exist.

  ## Examples

      iex> get_branch!(123)
      %Branch{}

      iex> get_branch!(456)
      ** (Ecto.NoResultsError)

  """
  def get_branch!(bank_id, id) do
    Branch
    |> where([b], b.bank_id == ^bank_id and b.id == ^id)
    |> Repo.one()
  end

  @doc """
  Creates a branch.

  ## Examples

      iex> create_branch(%{field: value})
      {:ok, %Branch{}}

      iex> create_branch(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_branch(attrs \\ %{}) do
    %Branch{}
    |> Branch.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a branch.

  ## Examples

      iex> update_branch(branch, %{field: new_value})
      {:ok, %Branch{}}

      iex> update_branch(branch, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_branch(%Branch{} = branch, attrs) do
    branch
    |> Branch.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a branch.

  ## Examples

      iex> delete_branch(branch)
      {:ok, %Branch{}}

      iex> delete_branch(branch)
      {:error, %Ecto.Changeset{}}

  """
  def delete_branch(%Branch{} = branch) do
    Repo.delete(branch)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking branch changes.

  ## Examples

      iex> change_branch(branch)
      %Ecto.Changeset{data: %Branch{}}

  """
  def change_branch(%Branch{} = branch, attrs \\ %{}) do
    Branch.changeset(branch, attrs)
  end
end
