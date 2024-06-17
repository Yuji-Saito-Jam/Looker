view: trial {
  derived_table: {
    sql:
      SELECT
        players.id,
        birth,
        club,
        country_id,
        name,
        height,
        position
      FROM
        "TRAINING_SOCCER"."PLAYERS" players
      LEFT JOIN
        "TRAINING_SOCCER"."GOALS" goals
      ON
        players.id = goals.player_id
        ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}."ID" ;;
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
  dimension: position {
    type: string
    sql:  ${TABLE}."position";;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  measure: count {
    type: count
  }

}
