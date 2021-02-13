# テーブル設計

## users テーブル

|       Column       |  Type  |    Options    |
|--------------------|--------|---------------|
|      nickname      | string |  null: false  |
|        email       | string |  null: false  |
| encrypted_password | string |  null: false  |
|     first_name     | string |  null: false  |
|      last_name     | string |  null: false  |
|  first_name_kana   | string |  null: false  |
|   last_name_kana   | string |  null: false  |
|     birth_day      |  date  |  null: false  |

### Association

- has_many :items
- has_many :purchases

## items テーブル

|       Column      |    Type    |      Options      |
|-------------------|------------|-------------------|
|        name       |   string   |    null: false    |
|    description    |    text    |    null: false    |
|       price       |   integer  |    null: false    |
|    category_id    |   integer  |    null: false    |
|    quality_id     |   integer  |    null: false    |
|   burden_fee_id   |   integer  |    null: false    |
|     prefecture    |   integer  |    null: false    |
|  days_to_ship_id  |   integer  |    null: false    |
|       user        | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

|  Column  |    Type    |      Options      |
|----------|------------|-------------------|
|   user   | references | foreign_key: true |
|   item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

|     Column    |    Type    |      Options      |
|---------------|------------|-------------------|
|  postal_code  |   string   |    null: false    |
|   prefecture  |   integer  |    null: false    |
|     city      |   string   |    null: false    |
| house_number  |   string   |    null: false    |
| building_name |   string   |                   |
|  phone_number |   string   |     null: false   |
|    purchase   | references | foreign_key: true |

## Association

- belongs_to :purchase