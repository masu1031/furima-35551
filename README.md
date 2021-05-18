## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| firstname          | string  | null: false               |
| lastname           | string  | null: false               |
| firstkana          | string  | null: false               |
| lastkana           | string  | null: false               |
| birthday           | date    | null: false               |

### Association
- has_many :products
- has_many :purchases

## products テーブル

| Column      | Type          | Options                        |
| ----------- | ------------- | ------------------------------ |
| name        | string        | null: false                    |
| introduce   | text          | null: false                    |
| category_id | integer       | null: false                    |
| status_id   | integer       | null: false                    |
| burden_id   | integer       | null: false                    |
| area_id     | integer       | null: false                    |
| day_id      | integer       | null: false                    |
| price       | integer       | null: false                    |
| user_id     | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase

## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| product_id     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one    :address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal         | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone          | string     | null: false                    |
| purchase_id    | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
