# テーブル設計

## usersテーブル

| Column                | Type     | Options     | 
| --------------------- | -------- | ----------- | 
| nickname              | string   | null: false | 
| email                 | string   | null: false, unique: true  | 
| encrypted_password    | string   | null: false | 
| family_name           | string   | null: false | 
| first_name            | string   | null: false | 
| family_name_kana      | string   | null: false | 
| first_name_kana       | string   | null: false | 
| date_of_birth         | date     | null: false | 


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
| shipping_cost_id | integer     | null: false                    | 
| shipping_area_id | integer     | null: false                    | 
| shipping_date_id | integer     | null: false                    | 
| price         | integer    | null: false                    | 
| user          | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- has_one :purchase_record


## purchase_recordsテーブル

| Column  | Type       | Options                        | 
| ------- | ---------- | ------------------------------ | 
| user    | references | null: false, foreign_key: true | 
| item    | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :item
- has_one : address


## addressesテーブル

| Column   | Type       | Options                        | 
| -------- | ---------- | ------------------------------ | 
| zipcode  | string     | null: false                    | 
| province | string     | null: false                    | 
| city     | string     | null: false                    | 
| address1 | string     | null: false                    | 
| address2 | string     | null: false                    | 
| phone    | string     | null: false                    | 
| purchase_records  | references | null: false, foreign_key: true | 

### Association
- belongs_to :purchase_record