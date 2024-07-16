// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

Table providers {
  id integer [primary key]
  provider_name varchar
}

Table products_type {
  id integer [primary key]
  product_type_name varchar
}

Table products {
  id integer [primary key]
  product_type_id integer
  product_name varchar
}

Table deals {
  id integer [primary key]
  provider_id integer
  dt datetime
}

Table tovars_in_deals {
  id integer [primary key]
  deal_id integer
  product_id integer
  weight real
  price real
}

table price {
  id integer [primary key]
  product_id integer
  provider_id integer
  value real 
  date_start date
  date_end date
}









Ref: "providers"."id" < "deals"."provider_id"


Ref: "deals"."id" < "tovars_in_deals"."deal_id"

Ref: "products"."product_type_id" < "products_type"."id"

Ref: "tovars_in_deals"."product_id" < "products"."id"

Ref: "products_type"."id" < "price"."product_id"

Ref: "providers"."id" < "price"."provider_id"