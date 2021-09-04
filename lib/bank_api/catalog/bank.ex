defmodule BankApi.Catalog.Bank do
  use Ecto.Schema
  import Ecto.Changeset

  alias BankApi.Catalog.Branch

  @primary_key {:id, :binary_id, autogenerate: true}

  @fields [:code, :name]

  schema "banks" do
    field :code, :string
    field :name, :string

    has_many :branches, Branch

    timestamps()
  end

  def changeset(bank, attrs) do
    bank
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
