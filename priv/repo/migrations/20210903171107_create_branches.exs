defmodule BankApi.Repo.Migrations.CreateBranches do
  use Ecto.Migration

  def change do
    create table(:branches) do
      add :name, :string
      add :phone, :string
      add :address, :string
      add :postal_code, :string
      add :district, :string
      add :number, :string
      add :bank_id, references(:banks, on_delete: :delete_all)

      timestamps()
    end

    create index(:branches, [:bank_id])
  end
end
