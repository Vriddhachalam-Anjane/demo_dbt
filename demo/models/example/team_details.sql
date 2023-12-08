with teams as(
    SELECT * FROM {{ ref ('teams') }}
),

team_locations as (
    SELECT * FROM {{ ref('team_locations') }}
),

final as (
    SELECT
    teams.team,
    team_locations.city as city,
    team_locations.state as state,
    teams.team = '{{var("current_champion")}}' as is_champion

    from teams

    left join team_locations
    on team_locations.name = teams.team
)

select * from final