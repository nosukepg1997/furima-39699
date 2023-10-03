# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| date_of_birth      | date   | null: false               |

### Association

- has_many :items
- has_one :profiles

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| description        | text       | null: false                    |
| category           | string     | null: false                    |
| condtion           | string     | null: false                    |
| delivery_cost      | string     | null: false                    |
| source_area        | string     | null: false                    |
| price              | int        | null: false                    |

### Association

- belongs_to :user

## profiles テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_number        | int        | null: false                    |
| security_code      | int        | null: false                    |
| post_code          | string     | null: false                    |
| state              | string     | null: false                    |
| city               | string     | null: false                    |
| street_address     | string     | null: false                    |
| building           | string     | null: false                    |
| telephone          | int        | null: false                    |

### Association

- belongs_to :user
