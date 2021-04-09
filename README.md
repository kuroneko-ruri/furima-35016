## Usersテーブル

| Column             | Type    | options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birth_day          | date    | null: false               |

Association

- has_many :items
- has_many :purchase

## itemsテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| cost_id          | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
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
- has_one :order

## orderテーブル
| Column             | Type options                           |
|--------------------|---------|-----------------------------------|
| post_code          | string  | null: false                       |
| prefecture_id      | integer | null: false                       |
| city               | string  | null: false                       |
| address            | string  | null: false                       |
| building_name      | string  |                                   |
| phone_number       | string  | null: false                       |
| purchase           | references | null: false, foreign_key: true |

Association

- belongs_to :purchase
