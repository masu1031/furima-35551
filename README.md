## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| password           | string  | null: false               |
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

| Column    | Type          | Options                        |
| --------- | ------------- | ------------------------------ |
| name      | string        | null: false                    |
| introduce | text          | null: false                    |
| category  | string        | null: false                    |
| status    | string        | null: false                    |
| burden    | string        | null: false                    |
| area      | string        | null: false                    |
| days      | string        | null: false                    |
| price     | integer       | null: false                    |
| user      | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchases

## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| product        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :products
- has_one    :addresses

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal         | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone          | string     | null: false                    |

### Association
- belongs_to :purchases
