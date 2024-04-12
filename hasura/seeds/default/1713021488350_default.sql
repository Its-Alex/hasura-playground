CREATE TABLE public.users (
    id              BIGSERIAL PRIMARY KEY,
    name            VARCHAR(60)
);

CREATE TABLE public.tags (
    id              BIGSERIAL PRIMARY KEY,
    name            VARCHAR(60)
);

CREATE TABLE public.users_tags (
    id              BIGSERIAL PRIMARY KEY,
    user_id         BIGSERIAL,
    tag_id          BIGSERIAL,
    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id) REFERENCES public.users("id"),
    CONSTRAINT fk_tag_id
        FOREIGN KEY(tag_id) REFERENCES public.tags("id")
);
