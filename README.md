## Usersテーブル

| Column             | Type    | options     |
|--------------------|---------|-------------|
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| barth_day          | integer | null: false |

Association

- has_many :items
- has_one :purchase

## itemsテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| cost_id          | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

Association

- belongs_to :user
- has_one :purchase

## purchase

| Column | Type       | options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル
| Column             | Type    | options     |
|--------------------|---------|-------------|
| post_code          | integer | null: false |
| prefecture         | string  | null: false |
| city               | string  | null: false |
| address            | string  | null: false |
| building_name      | string  |             |
| phone_number       | integer | null: false |

Association

- belongs_to :purchase
