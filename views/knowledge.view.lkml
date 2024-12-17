view: knowledge {
  derived_table: {
    sql:
      SELECT
        1 AS index,
        'tableau' AS name,
        'https://www.tableau.com/ja-jp/' AS official
      UNION ALL
      SELECT
        2 AS index,
        'sisense' AS name,
        'https://www.sisense.com/' AS official
      UNION ALL
      SELECT
        3 AS index,
        'snowflake' AS name,
        'https://www.snowflake.com/ja/' AS official
      UNION ALL
      SELECT
        4 AS index,
        'vizlib' AS name,
        'https://insightsoftware.com/vizlib/' AS official
      UNION ALL
      SELECT
        5 AS index,
        'qliksense' AS name,
        'https://www.qlik.com/ja-jp/products/qlik-sense' AS official
      UNION ALL
      SELECT
        6 AS index,
        'qlikview' AS name,
        'https://www.qlik.com/ja-jp/products/qlikview' AS official
      UNION ALL
      SELECT
        7 AS index,
        'aidx' AS name,
        Null AS official
        ;;
  }

  dimension: index {
    type: number
    sql: ${TABLE}.index ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: link {
    type: string
    sql: ${TABLE}.name ;;
    link: {
      label: "ISL_Knowladge"
      url: "https://knowledge.insight-lab.co.jp/{{ value }}"
    }
    order_by_field: index
  }

  dimension: html {
    type: string
    sql: ${TABLE}.name ;;
    html: <a href = "https://knowledge.insight-lab.co.jp/{{value}}">{{value}}</a> ;;
    order_by_field: index
  }

  dimension: official {
    type: string
    sql: ${TABLE}.official ;;
    html: <a href = {{value}}">
      {{value}}</a> ;;
  }

  measure: count {
    type: count
    link: {
      label: "ISL_Knowladge"
      url: "{{ official._value }}"
    }
  }
}
