# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

# usersテーブル

| Column             | type    | option                   |
| ------------------ | ------- | ------------------------ |
| email              | string  | null: false unique: true |
| encrypted_password | string  | null: false              |
| nickname           | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| last_name_furi     | string  | null: false              |
| first_name_furi    | string  | null: false              |
| birth              | date    | null: false              |

- has_many :products
- has_many :histories

# productsテーブル

| Column             | type          | option                        |
| ------------------ | ------------- | ----------------------------- |
| name               | string        | null: false                   |
| explanation        | text(1000)    | null: false                   |
| category_id        | integer       | null: false                   |
| state_id           | integer       | null: false                   |
| price              | integer       | null: false                   |
| load_id            | integer       | null: false                   |
| area_id            | integer       | null: false                   |
| delivery_id        | integer       | null: false                   |
| user               | references    | null: false foreign_key: true |


- belongs_to user
- has_one history


# historiesテーブル

| Column             | type       | option                        |
| ------------------ | ---------- | ----------------------------- |
| product            | references | null: false,foreign_key: true |
| user               | references | null: false,foreign_key: true |

- belongs_to product
- belongs_to user
- has_one address

# addressesテーブル

| Column             | type          | option                        |
| ------------------ | ------------- | ----------------------------- |
| postal_code        | string        | null: false                   |
| area_id            | integer       | null: false                   |
| city               | string        | null: false                   |
| house_number       | string        | null: false                   |
| building_name      | string        |                               |
| phone_number       | string        | null: false                   |
| history            | references    | null: false                   |

- belongs_to history
