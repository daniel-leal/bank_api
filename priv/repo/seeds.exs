# Banks
%{id: itau_id} =
  BankApi.Repo.insert!(%BankApi.Catalog.Bank{
    code: "341",
    name: "ITAÚ UNIBANCO S.A."
  })

BankApi.Repo.insert!(%BankApi.Catalog.Bank{
  code: "260",
  name: "Nu Pagamentos S.A."
})

BankApi.Repo.insert!(%BankApi.Catalog.Bank{
  code: "033",
  name: "BANCO SANTANDER (BRASIL) S.A."
})

# Branches
BankApi.Catalog.create_branch(%{
  address: "Av. Senador Lemos",
  district: "Umarizal",
  name: "AG. Senador",
  number: "1095",
  phone: "4004-4828",
  postal_code: "66050005",
  bank_id: itau_id,
  geom: %Geo.Point{coordinates: {-1.4384293, -48.48785}, srid: 4326}
})

BankApi.Catalog.create_branch(%{
  address: "Av. Visconde Souza Franco",
  district: "Reduto",
  name: "AG Doca",
  number: "957",
  phone: "4004-4828",
  postal_code: "66053000",
  bank_id: itau_id,
  geom: %Geo.Point{coordinates: {-1.4383005, -48.48785}, srid: 4326}
})

BankApi.Catalog.create_branch(%{
  address: "Tv. Benjamin Constant",
  district: "Nazaré",
  name: "AG Nazare",
  number: "1553",
  phone: "4004-4828",
  postal_code: "66035060",
  bank_id: itau_id,
  geom: %Geo.Point{coordinates: {-1.4539596, -48.492399}, srid: 4326}
})
