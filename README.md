# テーブル設計

## users テーブル

|     Column     |  Type  |    Options    |
|----------------|--------|---------------|
|    nickname    | string |  null: false  |
|      email     | string |  null: false  |
|    password    | string |  null: false  |
|   first_name   | string |  null: false  |
|    last_name   | string |  null: false  |
|first_name(kana)| string |  null: false  |
| last_name(kana)| string |  null: false  |

### Association

- has_many :items
- has_many :purchases

## items テーブル

|    Column    |    Type    |      Options      |
|--------------|------------|-------------------|
|     name     |   string   |    null: false    |
|  description |    text    |    null: false    |
|     price    |   integer  |    null: false    |
|    user_id   | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

|     Column    |    Type    |      Options      |
|---------------|------------|-------------------|
|  postal-code  |   integer  |    null: false    |
|     city      |   string   |    null: false    |
| house_number  |   integer  |    null: false    |
| building_name |   string   |                   |
|  phone_number |   integer  |     null: false   |
|    user_id    | references | foreign_key: true |
|    item_id    | references | foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item