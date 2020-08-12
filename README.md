# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_name_furigana | string | null: false |
| last_name_furigana  | string | null: false |
| birthday            | data   | null: false |
| nick_name           | string | null: false |
| email               | string | null: false |
| password            | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type    | Options     |
| --------------- | --------| ----------- |
| name            | string  | null: false |
| explanation     | text    | null: false |
| price           | integer | null: false |
| category        | integer | null: false |
| Status          | integer | null: false |
| shipping burden | integer | null: false |
| shipping area   | integer | null: false |
| shipping days   | integer | null: false |

### Association

- belongs_to :user
- has_one :purchase

## deliveries テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| post_code     | string  | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: false |
| prefectures   | integer | null: false |

### Association

- belongs_to :purchase


# purchase テーブル

| item | references | foreign_key: true |
| user | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery
