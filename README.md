# テーブル設計

## users テーブル

|       Column       |  Type  |    Options    |
|--------------------|--------|---------------|
|      nickname      | string |  null: false  |
|        email       | string |  null: false  |
| encrypted_password | string |  null: false  |
|     first_name     | string |  null: false  |
|      last_name     | string |  null: false  |
|  first_name(kana)  | string |  null: false  |
|   last_name(kana)  | string |  null: false  |
|     birth_year     | integer|  null: false  |
|     birth_month    | integer|  null: false  |
|      birth_day     | integer|  null: false  |

### Association

- has_many :items
- has_many :purchases
- has_one :address

## items テーブル

|    Column    |    Type    |      Options      |
|--------------|------------|-------------------|
|     name     |   string   |    null: false    |
|  description |    text    |    null: false    |
|     price    |   integer  |    null: false    |
|   category   |   string   |    null: false    |
|   quality    |   string   |    null: false    |
|  burden_fee  |   string   |    null: false    |
| shipping_area|   string   |    null: false    |
| days_to_ship |   string   |    null: false    |
|     user     | references | foreign_key: true |

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

## addresses テーブル

|     Column    |    Type    |      Options      |
|---------------|------------|-------------------|
|  postal-code  |   string   |    null: false    |
|     city      |   string   |    null: false    |
| house_number  |   string   |    null: false    |
| building_name |   string   |                   |
|  phone_number |   string   |     null: false   |
|      user     | references | foreign_key: true |

## Association

- belongs_to :user