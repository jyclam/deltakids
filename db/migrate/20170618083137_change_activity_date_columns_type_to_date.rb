class ChangeActivityDateColumnsTypeToDate < ActiveRecord::Migration[5.1]
  def change
    change_column :activities, :date_start, 'date using date_end::date'
    change_column :activities, :date_end, 'date using date_end::date'
    change_column :activities, :time_start, 'time using time_start::time'
    change_column :activities, :time_end, 'time using time_end::time'
  end
end
