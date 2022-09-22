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
| email              | string  | null: false              |
| encrypted_password | string  | null: false              |
| nickname           | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| last_name_furi     | string  | null: false              |
| first_name_furi    | string  | null: false              |
| birth              | integer | null: false              |


# productsテーブル

| Column             | type          | option                        |
| ------------------ | ------------- | ----------------------------- |
| name               | text(40)      | null: false                   |
| explanation        | text(1000)    | null: false                   |
| category           | integer       | null: false                   |
| state              | integer       | null: false                   |
| price              | integer       | null: false                   |
| user               | references    | null: false foreign_key: true |
| delivery           | references    | null: false foreign_key: true |


# deliveriesテーブル

| Column             | type       | option                        |
| ------------------ | ---------- | ----------------------------- |
| load               | integer    | null: false                   |
| area               | integer    | null: false |
| day                | integer    | null: false|
| product            | references | null: false foreign_key: true |


# commentsテーブル

| Column             | type       | option                        |
| ------------------ | ---------- | ----------------------------- |
| content            | text       | null: false                   |
| product            | references | null: false,foreign_key: true |
| user               | references | null: false,foreign_key: true |