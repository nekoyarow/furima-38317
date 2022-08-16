# テーブル設計

## usersテーブル

| Column                | Type     | Options     | 
| --------------------- | -------- | ----------- | 
| nickname              | string   | null: false | 
| email                 | string   | null: false | 
| password              | string   | null: false | 
| password_confirmation | string   | null: false | 
| family_name           | string   | null: false | 
| first_name            | string   | null: false | 
| family_name_kana      | string   | null: false | 
| first_name_kana       | string   | null: false | 
| date_of_birth_yy      | integer  | null: false | 
| date_of_birth_mm      | integer  | null: false | 
| date_of_birth_dd      | integer  | null: false | 

### Association
- has_many :items
- has_many :purchase_records


## itemsテーブル

| Column        | Type       | Options                        | 
| ------------- | ---------- | ------------------------------ | 
| name          | string     | null: false                    | 
| description   | text       | null: false                    | 
| category      | string     | null: false                    | 
| status        | string     | null: false                    | 
| shipping_cost | string     | null: false                    | 
| shipping_area | string     | null: false                    | 
| shipping_date | string     | null: false                    | 
| price         | integer    | null: false                    | 
| saler_id      | references | null: false, foreign_key: true | 
| buyer_id      | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- has_one :purchase_record


## purchase_recordsテーブル

| Column  | Type       | Options                        | 
| ------- | ---------- | ------------------------------ | 
| user_id | references | null: false, foreign_key: true | 
| item_id | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :item
- has_one : address


## addressesテーブル

| Column   | Type       | Options                        | 
| -------- | ---------- | ------------------------------ | 
| zipcode  | integer    | null: false                    | 
| province | string     | null: false                    | 
| city     | string     | null: false                    | 
| address1 | text       | null: false                    | 
| address2 | text       | null: false                    | 
| phone    | integer    | null: false                    | 
| user_id  | references | null: false, foreign_key: true | 
| purchase_records_id | | references | null: false, foreign_key: true | 

### Association
- belongs_to :purchase_record