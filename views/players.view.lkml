view: players {
  sql_table_name: "TRAINING_SOCCER"."PLAYERS" ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }
  dimension_group: birth {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."BIRTH" ;;
  }
  dimension_group: next_birth {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql:
    case
     when
      ${birth_date} > getdate())
      then
      dateadd(year, datediff(year, ${birth_raw}, getdate()), ${birth_year})
      else
      dateadd(year, datediff(year, ${birth_raw}, getdate()), ${birth_year}+1)
      end ;;
  }
  dimension: next_birthday {
    type: duration_day
    sql_start: getdate();;
    sql_end: ${next_birth_date}+1;;
  }
  dimension: club {
    type: string
    sql: ${TABLE}."CLUB" ;;
  }
  dimension: country_id {
    type: number
    sql: ${TABLE}."COUNTRY_ID" ;;
  }
  dimension: height {
    type: number
    sql: ${TABLE}."HEIGHT" ;;
  }
  dimension: name_position {
    type: string
    sql:  ${name} || ','||${position};;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }
  dimension: position {
    type: string
    sql: ${TABLE}."POSITION" ;;
  }
  dimension: uniform_num {
    type: number
    sql: ${TABLE}."UNIFORM_NUM" ;;
  }
  dimension: weight {
    type: number
    sql: ${TABLE}."WEIGHT" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, goals.count]
  }
}
