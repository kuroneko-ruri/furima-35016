## Usersテーブル

| Column             | Type    | options     |
|--------------------|---------|-------------|
| nickname           | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| barth_day          | integer | null: false |
| post_code          | integer | null: false |
| prefecture         | string  | null: false |
| city               | string  | null: false |
| address            | string  | null: false |
| building_name      | string  |             |
| phone_number       | integer | null: false |

Association

- has_many :items
- has_one :credit_card, dependent: :destroy
- belongs_to_active_hash :prefecture

## cardテーブル

| Column                | Type    | options     |
|-----------------------|---------|-------------|
| card_number           | integer | null: false |
| validity_period_month | integer | null: false |
| validity_period_year  | integer | null: false |
| security_code         | integer | null: false |

Association

- belongs_to :user

## itemsテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| items_name       | string     | null: false                    |
| price            | integer    | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false  foreign_key: true |
| items_ condition | string     | null: false  foreign_key: true |
| cost             | string     | null: false  foreign_key: true |
| shipping_area    | string     | null: false  foreign_key: true |
| shipping_days    | string     | null: false  foreign_key: true |
| image            | string     | null: false                    |
| user_id          | references | null: false, foreign_key: true |

Association

- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :items_condition
- belongs_to_active_hash :cost
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_days

## categoryテーブル

| Column | Type   | options     |
|--------|--------|-------------|
| name   | string | null: false |

Association

- has_many :items

## items_conditionテーブル

| Column | Type   | options     |
|--------|--------|-------------|
| value  | string | null: false |

Association

- has_many :items

## costテーブル

| Column | Type   | options     |
|--------|--------|-------------|
| value  | string | null: false |

Association

- has_many :items

## prefectureテーブル

| Column | Type   | options     |
|--------|--------|-------------|
| name   | string | null: false |

Association

- has_many :items
- hus_many :uses

## shipping_daysテーブル

| Column | Type   | options     |
|--------|--------|-------------|
| value  | string | null: false |

Association

- has_many :items
