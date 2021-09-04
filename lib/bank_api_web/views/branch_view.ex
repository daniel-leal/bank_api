defmodule BankApiWeb.BranchView do
  use BankApiWeb, :view
  alias BankApiWeb.BranchView

  def render("index.json", %{branches: branches}) do
    %{data: render_many(branches, BranchView, "branch.json")}
  end

  def render("show.json", %{branch: branch}) do
    %{data: render_one(branch, BranchView, "branch.json")}
  end

  def render("branch.json", %{branch: branch}) do
    %{
      id: branch.id,
      bank_id: branch.bank_id,
      name: branch.name,
      phone: branch.phone,
      address: branch.address,
      postal_code: branch.postal_code,
      district: branch.district,
      number: branch.number
    }
  end
end
