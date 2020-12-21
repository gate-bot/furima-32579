## users テーブル

| Column          | Type       | Options |
| --------------  | ---------- | ------------|
| nickname        | string     | null: false |
| email           | string     | null: false |
| password        | string     | null: false |
| last_name       | string     | null: false |
| first_name      | string     | null: false |
| last_name_kana  | string     | null: false |
| first_name_kana | string     | null: false |
| birth_year      | integer    | null: false |
| birth_month     | integer    | null: false |
| birth_day       | integer    | null: false |


### Association

- has_many :items
- has_many :addresses


## items テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| product_name | text       | null: false       |
| explanation  | text       | null: false       |
| category     | string     | null: false       |
| status       | string     | null: false       |
| bearer       | string     | null: false       |
| prefectures  | string     | null: false       |
| shipment     | string     | null: false       |
| price        | integer    | null: false       |
| user         | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :item_address
- has_one :address, through: :item_address


## addresses テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | integer    | null: false       |
| prefectures   | string     | null: false       |
| municipality  | string     | null: false       |
| address_num   | string     | null: false       |
| building_name | string     | null: false       |
| phone_num     | integer    | null: false       |
| user          | references | foreign_key: true |
| prototype     | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :items_addresses
- has_many :items, through: :items_addresses


## items_addresses テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| item          | references | foreign_key: true |
| address       | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :address
