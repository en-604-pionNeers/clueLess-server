ROOM_LAYOUT={
    rooms: [
        {
            id: '0',
            name: 'study',
            halls: ['study_hall', 'study_library'],
            secret_passage: 7
        },
        {
            id: '1',
            name: 'library',
            halls: ['study_library,' 'library_billiard', 'library_conservatory'],
            secret_passage: nil
        },
        {
            id: '2',
            name: 'conservatory',
            halls: ['library_conservatory', 'conservatory_ball'],
            secret_passage:5
        },
        {
            id: '3',
            name: 'billiard_room',
            halls: ['hall_billiard', 'libary_billiard', 'billiard_ball', 'billiard_dining'],
            secret_passage: nil
        },
        {
            id: '4',
            name: 'ball_room',
            halls: ['conservatory_ball', 'billiard_ball', 'ball_kitchen'],
            secret_passage: nil
        },
        {
            id: '5',
            name: 'lounge',
            halls: ['hall_lounge', 'lounge_dining'],
            secret_passage: 2
        },
        {
            id: '6',
            name: 'dining',
            halls: ['billiard_dining', 'lounge_dining', 'dining_kitchen'],
            secret_passage: nil
        },
        {
            id: '7',
            name: 'kitchen',
            halls: ['dining_kitchen', 'ball_kitchen'],
            secret_passage: 0
        },
        {
          id: '8',
          name: 'hall',
          halls: ['study_hall', 'hall_lounge'],
          secret_passage: nil
        }
    ]
}

HALLS=[
    'study_hall',
    'study_library',
    'library_billiard',
    'library_conservatory',
    'conservatory_ball',
    'hall_billiard',
    'billiard_ball',
    'billiard_dining',
    'ball_kitchen',
    'hall_lounge',
    'lounge_dining',
    'dining_kitchen'
]

WEAPONS=[
    :candlestick,
    :poison,
    :rope,
    :gloves,
    :horseshoe,
    :knife,
    :lead_pipe
]

PLAYER_PIECES=[
    'Ms. Vivienne Scarlet',
    'Col. Michael Mustard',
    'Mrs. Blanche White',
    'Rev. Jonathon Green',
    'Mrs. Elizabeth Peacock',
    'Professor Peter Plum'
]

PLAYER_PIECES_START={
    'Ms. Vivienne Scarlet' => 18,
    'Col. Michael Mustard' => 19,
    'Mrs. Blanche White' => 17,
    'Rev. Jonathon Green' => 13,
    'Mrs. Elizabeth Peacock' => 12,
    'Professor Peter Plum' => 10
}