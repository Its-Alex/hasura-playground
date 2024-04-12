INSERT INTO users
    (
        id,
        name
    )
    SELECT
        seq,
        ('user-' || to_char(seq, 'FM0000'))::VARCHAR
    FROM GENERATE_SERIES(1, 100) seq;
INSERT INTO tags
    (
        id,
        name
    )
    SELECT
        seq,
        ('tag-' || to_char(seq, 'FM0000'))::VARCHAR
    FROM GENERATE_SERIES(1, 100) seq;
INSERT INTO users_tags
    (
        id,
        user_id,
        tag_id
    )
    SELECT
        ROW_NUMBER() OVER(),
        public.users.id,
        public.tags.id
    FROM
        public.users
    CROSS JOIN public.tags;