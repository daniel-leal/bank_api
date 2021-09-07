defmodule BankApi.Repo.Migrations.BranchesAddGeomColumn do
  use Ecto.Migration

  def up do
    execute "CREATE EXTENSION IF NOT EXISTS postgis"
    alter table("branches") do
      add :geom, :geometry
    end
  end

  def down do
    execute "DROP EXTENSION IF EXISTS postgis"
    alter table("branches") do
      remove :geom
    end
  end
end
