defmodule BankApi.Catalog.Branch do
  use Ecto.Schema
  import Ecto.Changeset

  alias BankApi.Catalog.Bank

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:address, :district, :name, :number, :postal_code, :phone, :bank_id, :geom]

  schema "branches" do
    field :address, :string
    field :district, :string
    field :name, :string
    field :number, :string
    field :phone, :string
    field :postal_code, :string
    field :geom, Geo.PostGIS.Geometry

    belongs_to :bank, Bank

    timestamps()
  end

  def changeset(branch, attrs) do
    branch
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
