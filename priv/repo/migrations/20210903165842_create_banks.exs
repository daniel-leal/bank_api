defmodule BankApi.Repo.Migrations.CreateBanks do
  use Ecto.Migration

  def change do
    create table(:banks) do
      add :code, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:banks, [:code])
  end
end
