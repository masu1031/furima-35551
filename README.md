## users テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| nickname     | string  | null: false |
| email        | string  | null: false |
| password     | string  | null: false |
| firstname    | string  | null: false |
| lastname     | string  | null: false |
| firstkana    | string  | null: false |
| lastkana     | string  | null: false |
| yearofbirth  | date    | null: false |
| monthofbirth | date    | null: false |
| dayofbirth   | date    | null: false |

### Association
- has_many :products
- has_many :purchases


## products テーブル

| Column    | Type          | Options                        |
| --------- | ------------- | ------------------------------ |
| image     | ActiveStorage | null: false                    |
| name      | text          | null: false                    |
| introduce | text          | null: false                    |
| category  | string        | null: false                    |
| status    | string        | null: false                    |
| burden    | string        | null: false                    |
| area      | string        | null: false                    |
| days      | string        | null: false                    |
| price     | integer       | null: false                    |
| user      | references    | null: false, foreign_key: true |

### Association
- has_one    :purchases
- belongs_to :user


## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| cardnumber     | integer    | null: false                    |
| expirationdate | date       | null: false                    |
| securitycode   | integer    | null: false                    |
| postalcode     | integer    | null: false                    |
| prefectures    | string     | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| buildingname   | string     |                                |
| phonenumber    | interger   | null: false                    |
| user           | references | null: false, foreign_key: true |
| product        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :products
