--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12
-- Dumped by pg_dump version 15.12

-- Started on 2025-07-17 22:19:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 227 (class 1259 OID 66429)
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    is_default boolean,
    is_visible boolean,
    status character varying(50),
    phone character varying(50),
    street_detail character varying(255),
    ward_code character varying(20),
    district_id integer,
    province_id integer,
    user_id bigint,
    created_by character varying(255),
    updated_by character varying(255),
    created_at date,
    updated_at date
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 66428)
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO postgres;

--
-- TOC entry 3636 (class 0 OID 0)
-- Dependencies: 226
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- TOC entry 229 (class 1259 OID 66457)
-- Name: branches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branches (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at date,
    updated_at date
);


ALTER TABLE public.branches OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 66456)
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.branches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.branches_id_seq OWNER TO postgres;

--
-- TOC entry 3637 (class 0 OID 0)
-- Dependencies: 228
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.branches_id_seq OWNED BY public.branches.id;


--
-- TOC entry 245 (class 1259 OID 66568)
-- Name: cart_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_items (
    id bigint NOT NULL,
    price double precision,
    quantity integer,
    cart_id bigint,
    product_variant_id bigint NOT NULL
);


ALTER TABLE public.cart_items OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 66567)
-- Name: cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_items_id_seq OWNER TO postgres;

--
-- TOC entry 3638 (class 0 OID 0)
-- Dependencies: 244
-- Name: cart_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_items_id_seq OWNED BY public.cart_items.id;


--
-- TOC entry 243 (class 1259 OID 66556)
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts (
    id bigint NOT NULL,
    created_at date,
    updated_at date,
    user_id bigint NOT NULL
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 66555)
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_id_seq OWNER TO postgres;

--
-- TOC entry 3639 (class 0 OID 0)
-- Dependencies: 242
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- TOC entry 237 (class 1259 OID 66497)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    status character varying(50) NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at date,
    updated_at date
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 66496)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 3640 (class 0 OID 0)
-- Dependencies: 236
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 231 (class 1259 OID 66470)
-- Name: colors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colors (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.colors OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 66469)
-- Name: colors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colors_id_seq OWNER TO postgres;

--
-- TOC entry 3641 (class 0 OID 0)
-- Dependencies: 230
-- Name: colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colors_id_seq OWNED BY public.colors.id;


--
-- TOC entry 224 (class 1259 OID 66406)
-- Name: districts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.districts (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    province_id integer NOT NULL
);


ALTER TABLE public.districts OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 66488)
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id bigint NOT NULL,
    public_id character varying(255),
    file_name character varying(255),
    image_url character varying(1000),
    file_type character varying(20),
    created_by character varying(255),
    created_at date
);


ALTER TABLE public.files OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 66487)
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO postgres;

--
-- TOC entry 3642 (class 0 OID 0)
-- Dependencies: 234
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- TOC entry 214 (class 1259 OID 66320)
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 66626)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id bigint NOT NULL,
    quantity integer,
    unit_price double precision,
    product_variant_id bigint NOT NULL,
    order_id bigint
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 66625)
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_id_seq OWNER TO postgres;

--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 250
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- TOC entry 249 (class 1259 OID 66608)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    order_date date NOT NULL,
    total_price double precision NOT NULL,
    order_status character varying(50) NOT NULL,
    updated_at date,
    address_id bigint,
    user_id bigint
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 66607)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 248
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 253 (class 1259 OID 66644)
-- Name: payment_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_history (
    id bigint NOT NULL,
    is_primary boolean,
    payment_method character varying(50) NOT NULL,
    total_amount double precision NOT NULL,
    payment_status character varying(50) NOT NULL,
    payment_time timestamp without time zone,
    order_id bigint
);


ALTER TABLE public.payment_history OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 66643)
-- Name: payment_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_history_id_seq OWNER TO postgres;

--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 252
-- Name: payment_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_history_id_seq OWNED BY public.payment_history.id;


--
-- TOC entry 221 (class 1259 OID 66372)
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    module character varying(255),
    api_path character varying(1024),
    method character varying(20)
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 66371)
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 220
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- TOC entry 241 (class 1259 OID 66525)
-- Name: product_variants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variants (
    id bigint NOT NULL,
    is_available boolean,
    price double precision,
    quantity integer,
    status character varying(50) NOT NULL,
    product_id bigint,
    color_id bigint,
    size_id bigint,
    image_id bigint
);


ALTER TABLE public.product_variants OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 66524)
-- Name: product_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_variants_id_seq OWNER TO postgres;

--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 240
-- Name: product_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_variants_id_seq OWNED BY public.product_variants.id;


--
-- TOC entry 239 (class 1259 OID 66508)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    is_available boolean,
    sold_quantity integer,
    average_rating double precision,
    total_reviews integer,
    status character varying(50) NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at date,
    updated_at date,
    category_id bigint NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 66507)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 238
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 257 (class 1259 OID 66666)
-- Name: promotion_usages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion_usages (
    id bigint NOT NULL,
    discount_amount double precision,
    used_at timestamp without time zone,
    user_id bigint NOT NULL,
    promotion_id bigint NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE public.promotion_usages OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 66665)
-- Name: promotion_usages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promotion_usages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promotion_usages_id_seq OWNER TO postgres;

--
-- TOC entry 3649 (class 0 OID 0)
-- Dependencies: 256
-- Name: promotion_usages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promotion_usages_id_seq OWNED BY public.promotion_usages.id;


--
-- TOC entry 255 (class 1259 OID 66657)
-- Name: promotions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotions (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    description text,
    discount_percent integer,
    start_date date NOT NULL,
    end_date date NOT NULL,
    status character varying(50) NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at date,
    updated_at date
);


ALTER TABLE public.promotions OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 66656)
-- Name: promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promotions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promotions_id_seq OWNER TO postgres;

--
-- TOC entry 3650 (class 0 OID 0)
-- Dependencies: 254
-- Name: promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promotions_id_seq OWNED BY public.promotions.id;


--
-- TOC entry 223 (class 1259 OID 66401)
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 66691)
-- Name: refresh_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refresh_tokens (
    id bigint NOT NULL,
    token text NOT NULL,
    expiry_date timestamp without time zone NOT NULL
);


ALTER TABLE public.refresh_tokens OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 66690)
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refresh_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3651 (class 0 OID 0)
-- Dependencies: 258
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refresh_tokens_id_seq OWNED BY public.refresh_tokens.id;


--
-- TOC entry 247 (class 1259 OID 66587)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    rating double precision,
    comment text NOT NULL,
    image_urls jsonb,
    created_at date,
    updated_at date,
    user_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 66586)
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO postgres;

--
-- TOC entry 3652 (class 0 OID 0)
-- Dependencies: 246
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- TOC entry 222 (class 1259 OID 66384)
-- Name: role_has_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_has_permission (
    role_id bigint NOT NULL,
    permission_id bigint NOT NULL
);


ALTER TABLE public.role_has_permission OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 66344)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    created_at date,
    updated_at date
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 66343)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 3653 (class 0 OID 0)
-- Dependencies: 217
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 233 (class 1259 OID 66479)
-- Name: sizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sizes (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.sizes OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 66478)
-- Name: sizes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sizes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sizes_id_seq OWNER TO postgres;

--
-- TOC entry 3654 (class 0 OID 0)
-- Dependencies: 232
-- Name: sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sizes_id_seq OWNED BY public.sizes.id;


--
-- TOC entry 219 (class 1259 OID 66354)
-- Name: user_has_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_has_role (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL,
    state character varying(20)
);


ALTER TABLE public.user_has_role OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 66330)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    avatar_url character varying(512),
    dob date,
    gender character varying(20),
    status character varying(20),
    created_by character varying(255),
    updated_by character varying(255),
    created_at date,
    updated_at date
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 66329)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3655 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 225 (class 1259 OID 66417)
-- Name: wards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wards (
    code character varying(20) NOT NULL,
    name character varying(255) NOT NULL,
    district_id integer NOT NULL
);


ALTER TABLE public.wards OWNER TO postgres;

--
-- TOC entry 3296 (class 2604 OID 66432)
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- TOC entry 3297 (class 2604 OID 66460)
-- Name: branches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches ALTER COLUMN id SET DEFAULT nextval('public.branches_id_seq'::regclass);


--
-- TOC entry 3305 (class 2604 OID 66571)
-- Name: cart_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items ALTER COLUMN id SET DEFAULT nextval('public.cart_items_id_seq'::regclass);


--
-- TOC entry 3304 (class 2604 OID 66559)
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- TOC entry 3301 (class 2604 OID 66500)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3298 (class 2604 OID 66473)
-- Name: colors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colors ALTER COLUMN id SET DEFAULT nextval('public.colors_id_seq'::regclass);


--
-- TOC entry 3300 (class 2604 OID 66491)
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- TOC entry 3308 (class 2604 OID 66629)
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- TOC entry 3307 (class 2604 OID 66611)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3309 (class 2604 OID 66647)
-- Name: payment_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_history ALTER COLUMN id SET DEFAULT nextval('public.payment_history_id_seq'::regclass);


--
-- TOC entry 3295 (class 2604 OID 66375)
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- TOC entry 3303 (class 2604 OID 66528)
-- Name: product_variants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variants ALTER COLUMN id SET DEFAULT nextval('public.product_variants_id_seq'::regclass);


--
-- TOC entry 3302 (class 2604 OID 66511)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3311 (class 2604 OID 66669)
-- Name: promotion_usages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_usages ALTER COLUMN id SET DEFAULT nextval('public.promotion_usages_id_seq'::regclass);


--
-- TOC entry 3310 (class 2604 OID 66660)
-- Name: promotions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotions ALTER COLUMN id SET DEFAULT nextval('public.promotions_id_seq'::regclass);


--
-- TOC entry 3312 (class 2604 OID 66694)
-- Name: refresh_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('public.refresh_tokens_id_seq'::regclass);


--
-- TOC entry 3306 (class 2604 OID 66590)
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- TOC entry 3294 (class 2604 OID 66347)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3299 (class 2604 OID 66482)
-- Name: sizes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sizes ALTER COLUMN id SET DEFAULT nextval('public.sizes_id_seq'::regclass);


--
-- TOC entry 3293 (class 2604 OID 66333)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3598 (class 0 OID 66429)
-- Dependencies: 227
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (id, is_default, is_visible, status, phone, street_detail, ward_code, district_id, province_id, user_id, created_by, updated_by, created_at, updated_at) FROM stdin;
1	f	t	ACTIVE	0339896966	số 12, đường 19-5	1B1515	1542	201	2	lean270804@gmail.com	lean270804@gmail.com	2025-07-17	2025-07-17
3	t	t	ACTIVE	0339892222	phố 3	1B1515	1616	201	2	lean270804@gmail.com	lean270804@gmail.com	2025-07-17	2025-07-17
2	f	t	ACTIVE	0339896966	số 12, đường 19-5	1B1515	1542	201	2	lean270804@gmail.com	lean270804@gmail.com	2025-07-17	2025-07-17
5	t	t	ACTIVE	0339895522	phố 6	280301	1712	234	4	thuydung210305@gmail.com	thuydung210305@gmail.com	2025-07-17	2025-07-17
4	f	t	ACTIVE	0339895555	phố 2	91444	1616	201	4	thuydung210305@gmail.com	thuydung210305@gmail.com	2025-07-17	2025-07-17
\.


--
-- TOC entry 3600 (class 0 OID 66457)
-- Dependencies: 229
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branches (id, name, location, phone, status, created_by, updated_by, created_at, updated_at) FROM stdin;
2	Chi nhánh 2	456 Đường Nguyễn Huệ, Quận 1, TP. Hồ Chí Minh	0912345678	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
1	Chi nhánh 1	123 Đường Trần Duy Hưng, Quận Cầu Giấy, Hà Nội	0578647737	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
3	Chi nhánh 3	789 Đường Lê Duẩn, Quận Thanh Khê, Đà Nẵng	0987654321	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
4	Chi nhánh 4	321 Đường Phạm Văn Đồng, Quận Thủ Đức, TP. Hồ Chí Minh	0909090909	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
5	Chi nhánh 5	159 Đường Hoàng Hoa Thám, Quận Ba Đình, Hà Nội	0933123123	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
\.


--
-- TOC entry 3616 (class 0 OID 66568)
-- Dependencies: 245
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_items (id, price, quantity, cart_id, product_variant_id) FROM stdin;
1	299000	2	2	4
2	279000	4	2	15
3	310000	1	2	22
4	330000	3	2	60
5	350000	4	2	70
6	350000	4	4	71
7	310000	2	4	22
8	259000	3	4	33
9	370000	4	4	89
10	600000	3	4	100
11	600000	3	4	110
\.


--
-- TOC entry 3614 (class 0 OID 66556)
-- Dependencies: 243
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts (id, created_at, updated_at, user_id) FROM stdin;
1	2025-07-17	2025-07-17	1
2	2025-07-17	2025-07-17	2
3	2025-07-17	2025-07-17	3
4	2025-07-17	2025-07-17	4
\.


--
-- TOC entry 3608 (class 0 OID 66497)
-- Dependencies: 237
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, description, status, created_by, updated_by, created_at, updated_at) FROM stdin;
1	Sơ Mi	Áo Sơ Mi Nam	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
2	Áo Thun	Áo Thun Nam	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
3	Quần Jean	Quần Jean Nam	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
4	Áo Khoác	Áo Khoác Nam	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
5	Quần Short	Quần Short Nam	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
6	Đồ Thể Thao	Trang Phục Thể Thao Nam	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
7	Áo Polo	Áo Polo Nam	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
8	Quần Tây	Quần Tây Nam Công Sở	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
\.


--
-- TOC entry 3602 (class 0 OID 66470)
-- Dependencies: 231
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colors (id, name) FROM stdin;
1	Black
2	White
3	Red
4	Blue
5	Green
6	Yellow
7	Gray
\.


--
-- TOC entry 3595 (class 0 OID 66406)
-- Dependencies: 224
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.districts (id, name, province_id) FROM stdin;
2264	Huyện Si Ma Cai	269
2171	Huyện Mường Khương	269
2073	Huyện Bảo Thắng	269
2043	Huyện Văn Bàn	269
2005	Thị xã Sa Pa	269
1892	Huyện Bắc Hà	269
1891	Huyện Bảo Yên	269
1744	Huyện Bát Xát	269
1682	Thành phố Lào Cai	269
3451	Quận Đặc Biệt	268
2194	Huyện Phù Cừ	268
2046	Huyện Văn Lâm	268
2045	Huyện Văn Giang	268
2018	Huyện Tiên Lữ	268
1828	Huyện Yên Mỹ	268
1827	Thị xã Mỹ Hào	268
1826	Huyện Khoái Châu	268
1825	Huyện Ân Thi	268
1717	Huyện Kim Động	268
1680	Thành phố Hưng Yên	268
2270	Huyện Yên Thủy	267
2163	Huyện Mai Châu	267
2157	Huyện Lạc Thủy	267
2156	Huyện Lạc Sơn	267
2146	Huyện Kim Bôi	267
2087	Huyện Cao Phong	267
2014	Huyện Tân Lạc	267
1968	Huyện Lương Sơn	267
1955	Huyện Kỳ Sơn	267
1916	Huyện Đà Bắc	267
1678	Thành phố Hòa Bình	267
3266	huyện Sốp Cộp	266
3230	Huyện Mường La	266
2267	Huyện Yên Châu	266
2255	Huyện Vân Hồ	266
2204	Huyện Quỳnh Nhai	266
2079	Huyện Bắc Yên	266
2032	Huyện Thuận Châu	266
2007	Huyện Sông Mã	266
1996	Huyện Phù Yên	266
1976	Huyện Mộc Châu	266
1971	Huyện Mai Sơn	266
1677	Thành phố Sơn La	266
2179	Huyện Nậm Pồ	265
2170	Huyện Mường Ảng	265
2123	Huyện Điện Biên Đông	265
2060	Thị xã Mường Lay	265
2022	Huyện Tuần Giáo	265
2021	Huyện Tủa Chùa	265
1979	Huyện Mường Nhé	265
1978	Huyện Mường Chà	265
1923	Huyện Điện Biên	265
1676	Thành phố Điện Biên Phủ	265
2025	Huyện Than Uyên	264
2017	Huyện Tân Uyên	264
2010	Huyện Tam Đường	264
2006	Huyện Sìn Hồ	264
1989	Huyện Phong Thổ	264
1984	Huyện Nậm Nhùn	264
1980	Huyện Mường Tè	264
1675	Thành phố Lai Châu	264
2266	Huyện Yên Bình	263
2248	Huyện Trạm Tấu	263
2063	Thị xã Nghĩa Lộ	263
2047	Huyện Văn Yên	263
2044	Huyện Văn Chấn	263
2039	Huyện Trấn Yên	263
1977	Huyện Mù Cang Chải	263
1967	Huyện Lục Yên	263
1674	Thành phố Yên Bái	263
3312	Huyện Vân Canh	262
3279	Huyện Tây Sơn	262
3254	Huyện Phù Mỹ	262
2258	Huyện Vĩnh Thạnh	262
2140	Huyện Hoài Ân	262
2023	Huyện Tuy Phước	262
1886	Huyện An Lão	262
1771	Thị xã Hoài Nhơn	262
1770	Huyện Phù Cát	262
1769	Thị xã An Nhơn	262
1662	Thành phố Quy Nhơn	262
3302	Huyện Thuận Nam	261
3301	Huyện Thuận Bắc	261
3129	Huyện Bác Ái	261
1986	Huyện Ninh Phước	261
1985	Huyện Ninh Hải	261
1855	Huyện Ninh Sơn	261
1665	Thành phố Phan Rang – Tháp Chàm	261
3284	Huyện Tuy An	260
3278	Huyện Tây Hòa	260
3186	Huyện Đồng Xuân	260
3184	Thị xã Đông Hòa	260
2211	Huyện Sơn Hòa	260
2206	Huyện Sông Hinh	260
1993	Huyện Phú Hòa	260
1856	Thị Xã Sông Cầu	260
1663	Thành phố Tuy Hòa	260
3446	Huyện Ia H Drai	259
2225	Huyện Tu Mơ Rông	259
2205	Huyện Sa Thầy	259
2187	Huyện Ngọc Hồi	259
2148	Huyện Kon Rẫy	259
2121	Huyện Đắk Tô	259
1921	Huyện Đắk Glei	259
1835	Huyện Đắk Hà	259
1834	Huyện Kon Plông	259
1660	Thành phố Kon Tum	259
3196	Huyện Hàm Tân	258
2116	Huyện đảo Phú Quý	258
2012	Huyện Tánh Linh	258
1781	Huyện Tuy Phong	258
1780	Huyện Bắc Bình	258
1779	Huyện Đức Linh	258
1778	Thị xã La Gi	258
1777	Huyện Hàm Thuận Bắc	258
1776	Huyện Hàm Thuận Nam	258
1666	Thành phố Phan Thiết	258
2050	Huyện Vĩnh Lợi	253
1998	Huyện Phước Long	253
1946	Huyện Hồng Dân	253
1935	Thị Xã Giá Rai	253
1926	Huyện Đông Hải	253
1723	Huyện Hòa Bình	253
1655	Thành phố Bạc Liêu	253
2186	Huyện Ngọc Hiển	252
2042	Huyện U Minh	252
2038	Huyện Trần Văn Thời	252
1922	Huyện Đầm Dơi	252
1901	Huyện Cái Nước	252
1883	Huyện Phú Tân	252
1783	Huyện Năm Căn	252
1782	Huyện Thới Bình	252
1654	Thành phố Cà Mau	252
3445	Huyện Long Mỹ	250
3218	Thị xã Long Mỹ	250
2096	Huyện Châu Thành	250
2048	Huyện Vị Thuỷ	250
1912	Huyện Châu Thành A	250
1824	Huyện Phụng Hiệp	250
1823	Thành phố Ngã Bảy	250
1653	Thành phố Vị Thanh	250
1969	Huyện Lương Tài	249
1768	Huyện Yên Phong	249
1767	Thị xã Thuận Thành	249
1766	Huyện Gia Bình	249
1730	Thị xã Từ Sơn	249
1729	Huyện Tiên Du	249
1728	Huyện Quế Võ	249
1644	Thành phố Bắc Ninh	249
3701	Thị xã Chũ	248
1966	Huyện Lục Ngạn	248
1965	Huyện Lục Nam	248
1765	Huyện Yên Thế	248
1764	Huyện Yên Dũng	248
1763	Huyện Việt Yên	248
1762	Huyện Tân Yên	248
1761	Huyện Sơn Động	248
1760	Huyện Lạng Giang	248
1759	Huyện Hiệp Hòa	248
1643	Thành phố Bắc Giang	248
3311	Huyện Văn Quan	247
3310	Huyện Văn Lãng	247
3182	Huyện Đình Lập	247
3156	Huyện Chi Lăng	247
3138	Huyện Bình Gia	247
3134	Huyện Bắc Sơn	247
2036	Huyện Tràng Định	247
1963	Huyện Lộc Bình	247
1948	Huyện Hữu Lũng	247
1904	Huyện Cao Lộc	247
1642	Thành phố Lạng Sơn	247
3694	Huyện Quảng Hòa	246
3305	Huyện Trà Lĩnh	246
3299	Huyện Thông Nông	246
3289	Huyện Thạch An	246
3259	Huyện Quảng Uyên	246
3246	Huyện Nguyên Bình	246
3194	Huyện Hạ Lang	246
3130	Huyện Bảo Lạc	246
2041	Huyện Trùng Khánh	246
1997	Huyện Phục Hòa	246
1943	Huyện Hòa An	246
1939	Huyện Hà Quảng	246
1890	Huyện Bảo Lâm	246
1641	Thành phố Cao Bằng	246
3249	Huyện Pác Nặm	245
3242	Huyện Ngân Sơn	245
3232	Huyện Na Rì	245
1914	Huyện Chợ Mới	245
1913	Huyện Chợ Đồn	245
1889	Huyện Bạch Thông	245
1887	Huyện Ba Bể	245
1640	Thành phố Bắc Kạn	245
2195	Huyện Phú Lương	244
2051	Huyện Võ Nhai	244
1991	Huyện Phú Bình	244
1990	Thị xã Phổ Yên	244
1924	Huyện Định Hóa	244
1918	Huyện Đại Từ	244
1731	Huyện Đồng Hỷ	244
1684	Thành Phố Sông Công	244
1639	Thành phố Thái Nguyên	244
2239	Huyện Thăng Bình	243
2224	Huyện Tiên Phước	243
2219	Huyện Tây Giang	243
2198	Huyện Phước Sơn	243
2182	Huyện Nông Sơn	243
2178	Huyện Nam Trà My	243
2177	Huyện Nam Giang	243
2139	Huyện Hiệp Đức	243
2125	Huyện Đông Giang	243
2078	Huyện Bắc Trà My	243
2003	Huyện Quế Sơn	243
1995	Huyện Phú Ninh	243
1987	Huyện Núi Thành	243
1917	Huyện Đại Lộc	243
1736	Thị xã Điện Bàn	243
1735	Huyện Duy Xuyên	243
1632	Thành phố Hội An	243
1631	Thành phố Tam Kỳ	243
3304	Huyện Trà Bồng	242
3270	Huyện Sơn Tây	242
3226	Huyện Mộ Đức	242
3127	Huyện Ba Tơ	242
2222	Huyện Tây Trà	242
2210	Huyện Sơn Hà	242
2167	Huyện Minh Long	242
2114	Huyện đảo Lý Sơn	242
1988	Huyện Nghĩa Hành	242
1930	Thị xã Đức Phổ	242
1898	Huyện Bình Sơn	242
1738	Huyện Tư Nghĩa	242
1737	Huyện Sơn Tịnh	242
1630	Thành phố Quảng Ngãi	242
3152	Huyện Cư Jút	241
2227	Huyện Tuy Đức	241
2151	Huyện Krông Nô	241
2120	Huyện Đắk Song	241
1792	Huyện Đắk Mil	241
1791	Huyện Đắk Glong	241
1790	Huyện Đắk R lấp	241
1627	Thành phố Gia Nghĩa	241
2035	Thị xã Trảng Bàng	240
1866	Huyện Gò Dầu	240
1865	Huyện Bến Cầu	240
1864	Huyện Dương Minh Châu	240
1863	Huyện Tân Châu	240
1862	Huyện Tân Biên	240
1721	Thị xã Hòa Thành	240
1720	Huyện Châu Thành	240
1626	Thành phố Tây Ninh	240
3444	Huyện Phú Riềng	239
3141	Huyện Bù Gia Mập	239
3140	Huyện Bù Đốp	239
1964	Huyện Lộc Ninh	239
1899	Huyện Bù Đăng	239
1775	Thị xã Phước Long	239
1774	Thị xã Bình Long	239
1773	Huyện Hớn Quản	239
1772	Huyện Chơn Thành	239
1722	Huyện Đồng Phú	239
1625	Thành phố Đồng Xoài	239
2137	Huyện Hải Lăng	238
2110	Huyện đảo Cồn Cỏ	238
2105	Huyện Đa Krông	238
2040	Huyện Triệu Phong	238
1936	Huyện Gio Linh	238
1903	Huyện Cam Lộ	238
1861	Huyện Vĩnh Linh	238
1860	Huyện Hướng Hóa	238
1621	Thị xã Quảng Trị	238
1620	Thành phố Đông Hà	238
3286	Huyện Tuyên Hóa	237
3258	Huyện Quảng Trạch	237
3224	Huyện Minh Hóa	237
2002	Huyện Quảng Ninh	237
1859	Thị xã Ba Đồn	237
1858	Huyện Bố Trạch	237
1857	Huyện Lệ Thủy	237
1619	Thành phố Đồng Hới	237
3441	Thị xã Kỳ Anh	236
3320	Huyện Vũ Quang	236
3220	Huyện Lộc Hà	236
3201	Huyện Hương Sơn	236
3188	Huyện Đức Thọ	236
3143	Huyện Can Lộc	236
2024	Huyện Thạch Hà	236
1815	Huyện Cẩm Xuyên	236
1814	Thị xã Hồng Lĩnh	236
1813	Huyện Nghi Xuân	236
1812	Huyện Hương Khê	236
1811	Huyện Kỳ Anh	236
1618	Thành phố Hà Tĩnh	236
3291	Huyện Thanh Chương	235
3288	Huyện Tương Dương	235
3261	Huyện Quỳ Châu	235
3260	Huyện Quế Phong	235
3233	Huyện Nam Đàn	235
3211	Huyện Kỳ Sơn	235
1947	Huyện Hưng Nguyên	235
1854	Huyện Nghi Lộc	235
1853	Huyện Con Cuông	235
1852	Huyện Quỳ Hợp	235
1851	Huyện Nghĩa Đàn	235
1850	Thị xã Thái Hòa	235
1849	Thị xã Hoàng Mai	235
1848	Huyện Quỳnh Lưu	235
1847	Huyện Diễn Châu	235
1846	Huyện Yên Thành	235
1845	Huyện Tân Kỳ	235
1844	Huyện Anh Sơn	235
1843	Huyện Đô Lương	235
1842	Thị xã Cửa Lò	235
1617	Thành phố Vinh	235
3298	Huyện Thiệu Hóa	234
3241	Huyện Nga Sơn	234
3216	Huyện Lang Chánh	234
3147	Huyện Cẩm Thủy	234
2249	Huyện Triệu Sơn	234
2190	Huyện Như Thanh	234
2181	Huyện Nông Cống	234
2070	Huyện Bá Thước	234
2000	Huyện Quan Sơn	234
1942	Huyện Hậu Lộc	234
1927	Huyện Đông Sơn	234
1881	Huyện Vĩnh Lộc	234
1880	Huyện Thạch Thành	234
1879	Huyện Quan Hóa	234
1878	Huyện Mường Lát	234
1877	Huyện Hà Trung	234
1876	Thị xã Bỉm Sơn	234
1875	Huyện Yên Định	234
1874	Huyện Ngọc Lặc	234
1873	Huyện Thọ Xuân	234
1872	Huyện Thường Xuân	234
1871	Huyện Như Xuân	234
1870	Thị Xã Nghi Sơn	234
1748	Huyện Hoằng Hóa	234
1747	Huyện Quảng Xương	234
1712	Thành phố Sầm Sơn	234
1616	Thành phố Thanh Hóa	234
3327	Huyện Yên Mô	233
3247	Huyện Nho Quan	233
3205	Huyện Kim Sơn	233
3191	Huyện Gia Viễn	233
1944	Huyện Hoa Lư	233
1714	Huyện Yên Khánh	233
1713	Thành phố Tam Điệp	233
1615	Thành phố Ninh Bình	233
2027	Huyện Thanh Liêm	232
1970	Huyện Lý Nhân	232
1952	Huyện Kim Bảng	232
1897	Huyện Bình Lục	232
1802	Thị xã Duy Tiên	232
1614	Thành phố Phủ Lý	232
3323	Huyện Xuân Trường	231
3319	Huyện Vụ Bản	231
3308	Huyện Trực Ninh	231
3243	Huyện Nghĩa Hưng	231
3193	Huyện Giao Thủy	231
1983	Huyện Nam Trực	231
1981	Huyện Mỹ Lộc	231
1841	Huyện Ý Yên	231
1840	Huyện Hải Hậu	231
1613	Thành phố Nam Định	231
3199	Huyện Hoành Bồ	230
3185	Thị xã Đông Triều	230
3180	Huyện Đầm Hà	230
3126	Huyện Ba Chẽ	230
2109	Huyện đảo Cô Tô	230
2066	Thị xã Quảng Yên	230
2019	Huyện Tiên Yên	230
1940	Huyện Hải Hà	230
1920	Huyện đảo Vân Đồn	230
1896	Huyện Bình Liêu	230
1686	Thành phố Uông Bí	230
1683	Thành phố Cẩm Phả	230
1604	Thành phố Hạ Long	230
1603	Thành phố Móng Cái	230
3290	Huyện Thanh Ba	229
3272	Huyện Tam Nông	229
2268	Huyện Yên Lập	229
2237	Huyện Thanh Thủy	229
2064	Thị xã Phú Thọ	229
2029	Huyện Thanh Sơn	229
2015	Huyện Tân Sơn	229
1994	Huyện Phù Ninh	229
1959	Huyện Lâm Thao	229
1938	Huyện Hạ Hòa	229
1925	Huyện Đoan Hùng	229
1905	Huyện Cẩm Khê	229
1602	Thành phố Việt Trì	229
3267	Huyện Sơn Dương	228
3157	Huyện Chiêm Hóa	228
1982	Huyện Na Hang	228
1957	Huyện Lâm Bình	228
1941	Huyện Hàm Yên	228
1745	Huyện Yên Sơn	228
1601	Thành phố Tuyên Quang	228
2256	Huyện Vị Xuyên	227
2075	Huyện Bắc Mê	227
2053	Huyện Yên Minh	227
2052	Huyện Xín Mần	227
2001	Huyện Quang Bình	227
1999	Huyện Quản Bạ	227
1973	Huyện Mèo Vạc	227
1945	Huyện Hoàng Su Phì	227
1928	Huyện Đồng Văn	227
1893	Huyện Bắc Quang	227
1600	Thành phố Hà Giang	227
3281	Huyện Tiền Hải	226
1951	Huyện Kiến Xương	226
1869	Huyện Thái Thụy	226
1868	Huyện Quỳnh Phụ	226
1867	Huyện Hưng Hà	226
1716	Huyện Vũ Thư	226
1715	Huyện Đông Hưng	226
1599	Thành phố Thái Bình	226
3294	Huyện Thanh Miện	225
3292	Huyện Thanh Hà	225
3287	Huyện Tứ Kỳ	225
3238	Huyện Ninh Giang	225
2056	Thành phố Chí Linh	225
1953	Huyện Kim Thành	225
1934	Huyện Gia Lộc	225
1818	Thị xã Kinh Môn	225
1817	Huyện Cẩm Giàng	225
1816	Huyện Bình Giang	225
1727	Huyện Nam Sách	225
1598	Thành phố Hải Dương	225
3203	Huyện Kiến Thụy	224
2108	Huyện đảo Cát Hải	224
2107	Huyện đảo Bạch Long Vĩ	224
1822	Huyện Vĩnh Bảo	224
1821	Huyện Tiên Lãng	224
1820	Huyện An Lão	224
1819	Huyện An Dương	224
1726	Huyện Thủy Nguyên	224
1707	Quận Đồ Sơn	224
1706	Quận Dương Kinh	224
1591	Quận Hải An	224
1590	Quận Kiến An	224
1589	Quận Hồng Bàng	224
1588	Quận Lê Chân	224
1587	Quận Ngô Quyền	224
3703	Quận Phú Xuân	223
3702	Quận Thuận Hóa	223
3257	Huyện Quảng Điền	223
3234	Huyện Nam Đông	223
2193	Huyện Phong Điền	223
1885	Huyện A Lưới	223
1882	Huyện Phú Lộc	223
1749	Huyện Phú Vang	223
1698	Thị xã Hương Thủy	223
1697	Thị xã Hương Trà	223
1585	Thành phố Huế	223
3271	Huyện Tam Đảo	221
3265	Huyện Sông Lô	221
2065	Thành phố Phúc Yên	221
2009	Huyện Tam Dương	221
1960	Huyện Lập Thạch	221
1734	Huyện Yên Lạc	221
1733	Huyện Vĩnh Tường	221
1732	Huyện Bình Xuyên	221
1578	Thành phố Vĩnh Yên	221
3317	Huyện Vĩnh Thạnh	220
3300	Huyện Thới Lai	220
3250	Huyện Phong Điền	220
3150	Huyện Cờ Đỏ	220
1576	Quận Thốt Nốt	220
1575	Quận Ô Môn	220
1574	Quận Cái Răng	220
1573	Quận Bình Thủy	220
1572	Quận Ninh Kiều	220
3125	Huyện An Minh	219
2260	Huyện Vĩnh Thuận	219
2251	Huyện U Minh Thượng	219
2134	Huyện Giang Thành	219
2132	Huyện Gò Quao	219
2115	Thành phố Phú Quốc	219
2113	Huyện đảo Kiên Hải	219
2058	Thành phố Hà Tiên	219
1950	Huyện Kiên Lương	219
1833	Huyện An Biên	219
1832	Huyện Giồng Riềng	219
1831	Huyện Tân Hiệp	219
1830	Huyện Hòn Đất	219
1719	Huyện Châu Thành	219
1570	Thành phố Rạch Giá	219
2272	Thị xã Vĩnh Châu	218
2238	Huyện Thạnh Trị	218
2173	Huyện Mỹ Tú	218
2161	Huyện Long Phú	218
2093	Huyện Cù Lao Dung	218
2062	Thị xã Ngã Năm	218
2037	Huyện Trần Đề	218
1949	Huyện Kế Sách	218
1910	Huyện Châu Thành	218
1743	Huyện Mỹ Xuyên	218
1568	Thành phố Sóc Trăng	218
1758	Huyện Châu Phú	217
1757	Huyện Chợ Mới	217
1756	Huyện Phú Tân	217
1755	Thị Xã Tân Châu	217
1754	Huyện An Phú	217
1753	Thành phố Châu Đốc	217
1752	Huyện Tịnh Biên	217
1751	Huyện Tri Tôn	217
1750	Huyện Thoại Sơn	217
1718	Huyện Châu Thành	217
1566	Thành phố Long Xuyên	217
3696	Huyện Hồng Ngự	216
3200	Huyện Hồng Ngự	216
3155	Huyện Châu Thành	216
2059	Thành Phố Hồng Ngự	216
2030	Huyện Tháp Mười	216
2026	Huyện Thanh Bình	216
2013	Huyện Tân Hồng	216
2011	Huyện Tam Nông	216
1961	Huyện Lấp Vò	216
1725	Huyện Lai Vung	216
1724	Huyện Cao Lãnh	216
1668	Thành phố Sa Đéc	216
1564	Thành phố Cao Lãnh	216
2263	Huyện Vũng Liêm	215
2164	Huyện Mang Thít	215
2081	Huyện Bình Tân	215
2054	Thị xã Bình Minh	215
2034	Huyện Trà Ôn	215
2008	Huyện Tam Bình	215
1962	Huyện Long Hồ	215
1562	Thành phố Vĩnh Long	215
3443	Thị xã Duyên Hải	214
2103	Huyện Duyên Hải	214
2091	Huyện Cầu Kè	214
2086	Huyện Càng Long	214
2033	Huyện Trà Cú	214
2020	Huyện Tiểu Cần	214
1911	Huyện Châu Thành	214
1908	Huyện Cầu Ngang	214
1560	Thành phố Trà Vinh	214
3158	Huyện Chợ Lách	213
2028	Huyện Thạnh Phú	213
1975	Huyện Mỏ Cày Nam	213
1974	Huyện Mỏ Cày Bắc	213
1937	Huyện Giồng Trôm	213
1895	Huyện Bình Đại	213
1888	Huyện Ba Tri	213
1742	Huyện Châu Thành	213
1558	Thành phố Bến Tre	213
3275	Huyện Tân Phước	212
2216	Huyện Tân Phú Đông	212
2084	Huyện Cai Lậy	212
2057	Thị xã Gò Công	212
2055	Thị Xã Cai Lậy	212
1933	Huyện Gò Công Tây	212
1932	Huyện Gò Công Đông	212
1900	Huyện Cái Bè	212
1741	Huyện Chợ Gạo	212
1740	Huyện Châu Thành	212
1556	Thành phố Mỹ Tho	212
3329	Thị xã Kiến Tường	211
3315	Huyện Vĩnh Hưng	211
3293	Huyện Thạnh Hóa	211
3276	Huyện Tân Thạnh	211
3273	Huyện Tân Hưng	211
3227	Huyện Mộc Hóa	211
2129	Huyện Đức Huệ	211
2031	Huyện Thủ Thừa	211
2016	Huyện Tân Trụ	211
1929	Huyện Đức Hòa	211
1909	Huyện Châu Thành	211
1907	Huyện Cần Giuộc	211
1906	Huyện Cần Đước	211
1894	Huyện Bến Lức	211
1554	Thành phố Tân An	211
3418	Huyện M Đrắk	210
3217	Huyện Lắk	210
3153	Huyện Cư Kuin	210
2150	Huyện Krông Búk	210
2131	Huyện Ea Súp	210
1954	Huyện Krông Pắc	210
1931	Huyện Ea Kar	210
1884	Huyện Krông Ana	210
1789	Huyện Krông Bông	210
1788	Thị xã Buôn Hồ	210
1787	Huyện Krông Năng	210
1786	Huyện Ea H leo	210
1785	Huyện Cư M gar	210
1784	Huyện Buôn Ðôn	210
1552	Thành phố Buôn Ma Thuột	210
3160	Huyện Di Linh	209
3146	Huyện Cát Tiên	209
2106	Huyện Đạ Tẻh	209
2104	Huyện Đạ Huoai	209
1958	Huyện Lâm Hà	209
1956	Huyện Lạc Dương	209
1919	Huyện Đam Rông	209
1839	Huyện Bảo Lâm	209
1838	Thành phố Bảo Lộc	209
1837	Huyện Đức Trọng	209
1836	Huyện Đơn Dương	209
1550	Thành phố Đà Lạt	209
3213	Huyện Khánh Vĩnh	208
3212	Huyện Khánh Sơn	208
2117	Huyện đảo Trường Sa	208
2061	Thị xã Ninh Hòa	208
1902	Huyện Cam Lâm	208
1829	Huyện Vạn Ninh	208
1739	Huyện Diên Khánh	208
1664	Thành phố Cam Ranh	208
1548	Thành phố Nha Trang	208
2165	Huyện Mang Yang	207
2152	Huyện Krông Pa	207
2149	Huyện Kông Chro	207
2144	Huyện Kbang	207
2119	Huyện Đắk Pơ	207
2118	Huyện Đắk Đoa	207
2101	Huyện Chư Pưh	207
1801	Huyện Chư Păh	207
1800	Thị xã An Khê	207
1799	Huyện Ia Pa	207
1798	Thị xã Ayun Pa	207
1797	Huyện Phú Thiện	207
1796	Huyện Chư Sê	207
1795	Huyện Chư Prông	207
1794	Huyện Đức Cơ	207
1793	Huyện Ia Grai	207
1546	Thành phố Pleiku	207
3704	Huyện Long Đất	206
2111	Huyện đảo Côn Đảo	206
1709	Huyện Châu Đức	206
1701	Thị Xã Phú Mỹ	206
1699	Huyện Xuyên Mộc	206
1690	Huyện Đất Đỏ	206
1689	Huyện Long Điền	206
1688	TT Phú Mỹ - cũ	206
1667	Thành phố Bà Rịa	206
1544	Thành phố Vũng Tàu	206
3135	Huyện Bắc Tân Uyên	205
3132	Huyện Bàu Bàng	205
1992	Huyện Phú Giáo	205
1746	Huyện Dầu Tiếng	205
1696	Thị xã Bến Cát	205
1695	Thành phố Tân Uyên	205
1541	Thành phố Thuận An	205
1540	Thành phố Dĩ An	205
1538	Thành phố Thủ Dầu Một	205
2049	Huyện Vĩnh Cửu	204
1708	Huyện Nhơn Trạch	204
1705	Huyện Thống Nhất	204
1704	Huyện Xuân Lộc	204
1702	Huyện Cẩm Mỹ	204
1700	Huyện Định Quán	204
1694	Huyện Long Thành	204
1693	Huyện Tân Phú	204
1692	Thành phố Long Khánh	204
1691	Huyện Trảng Bom	204
1536	Thành phố Biên Hòa	204
2112	Huyện đảo Hoàng Sa	203
1687	Huyện Hòa Vang	203
1531	Quận Cẩm Lệ	203
1530	Quận Liên Chiểu	203
1529	Quận Ngũ Hành Sơn	203
1528	Quận Sơn Trà	203
1527	Quận Thanh Khê	203
1526	Quận Hải Châu	203
3695	Thành Phố Thủ Đức	202
2090	Huyện Cần Giờ	202
1534	Huyện Nhà Bè	202
1533	Huyện Bình Chánh	202
1463	Quận Thủ Đức	202
1462	Quận Bình Thạnh	202
1461	Quận Gò Vấp	202
1460	Huyện Củ Chi	202
1459	Huyện Hóc Môn	202
1458	Quận Bình Tân	202
1457	Quận Phú Nhuận	202
1456	Quận Tân Phú	202
1455	Quận Tân Bình	202
1454	Quận 12	202
1453	Quận 11	202
1452	Quận 10	202
1451	Quận 9	202
1450	Quận 8	202
1449	Quận 7	202
1448	Quận 6	202
1447	Quận 5	202
1446	Quận 4	202
1444	Quận 3	202
1443	Quận 2	202
1442	Quận 1	202
3440	Quận Nam Từ Liêm	201
3303	Huyện Thường Tín	201
3255	Huyện Phú Xuyên	201
2004	Huyện Quốc Oai	201
1915	Huyện Chương Mỹ	201
1810	Huyện Ứng Hòa	201
1809	Huyện Thanh Oai	201
1808	Huyện Thạch Thất	201
1807	Huyện Phúc Thọ	201
1806	Huyện Mỹ Đức	201
1805	Huyện Hoài Đức	201
1804	Huyện Đan Phượng	201
1803	Huyện Ba Vì	201
1711	Thị xã Sơn Tây	201
1710	Huyện Thanh Trì	201
1703	Huyện Gia Lâm	201
1583	Huyện Sóc Sơn	201
1582	Huyện Đông Anh	201
1581	Huyện Mê Linh	201
1542	Quận Hà Đông	201
1493	Quận Thanh Xuân	201
1492	Quận Tây Hồ	201
1491	Quận Long Biên	201
1490	Quận Hoàng Mai	201
1489	Quận Hoàn Kiếm	201
1488	Quận Hai Bà Trưng	201
1486	Quận Đống Đa	201
1485	Quận Cầu Giấy	201
1484	Quận Ba Đình	201
1482	Quận Bắc Từ Liêm	201
\.


--
-- TOC entry 3606 (class 0 OID 66488)
-- Dependencies: 235
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, public_id, file_name, image_url, file_type, created_by, created_at) FROM stdin;
1	adam-store/images/cqgnl2xpi5fqj69dfabw	1.1.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752760744/adam-store/images/cqgnl2xpi5fqj69dfabw.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
2	adam-store/images/iwk0haavoqpzcebyvrjm	1.2.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752760748/adam-store/images/iwk0haavoqpzcebyvrjm.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
3	adam-store/images/ans2havpgzrpqujfowhi	1.3.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752760751/adam-store/images/ans2havpgzrpqujfowhi.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
7	adam-store/images/ultrsqijubdrjii3alzb	2.1.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752762367/adam-store/images/ultrsqijubdrjii3alzb.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
8	adam-store/images/shjkzjzx0qwooznbkyay	2.2.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752762370/adam-store/images/shjkzjzx0qwooznbkyay.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
9	adam-store/images/xbrdjmvzla5clptnmm3d	2.3.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752762373/adam-store/images/xbrdjmvzla5clptnmm3d.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
10	adam-store/images/mvlnhnmhf7vt82h1ks3g	3.1.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752762808/adam-store/images/mvlnhnmhf7vt82h1ks3g.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
11	adam-store/images/zbqm1kz7ycxvwmx9k85i	3.2.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752762810/adam-store/images/zbqm1kz7ycxvwmx9k85i.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
12	adam-store/images/ofwwrvfjq6dkuqzbi6ge	3.3.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752762813/adam-store/images/ofwwrvfjq6dkuqzbi6ge.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
13	adam-store/images/svjgltcvuja8csaohprf	3.4.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752762816/adam-store/images/svjgltcvuja8csaohprf.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
14	adam-store/images/suwliauuirprjhraccwf	1.1.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752762939/adam-store/images/suwliauuirprjhraccwf.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
15	adam-store/images/t7bcngzwxwdeilpjndze	1.2.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752762942/adam-store/images/t7bcngzwxwdeilpjndze.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
16	adam-store/images/vwtqyt8sr2akovdy1lds	1.3.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752762944/adam-store/images/vwtqyt8sr2akovdy1lds.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
17	adam-store/images/b2fno6iz3q5eyavysllp	1.4.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752762947/adam-store/images/b2fno6iz3q5eyavysllp.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
18	adam-store/images/e8lyclxug2qe2xfqz7gv	2.1.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763204/adam-store/images/e8lyclxug2qe2xfqz7gv.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
19	adam-store/images/jnzdc05kr70rk0zivvqy	2.2.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763207/adam-store/images/jnzdc05kr70rk0zivvqy.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
20	adam-store/images/rzdueqmayxmfo8fw3dat	2.3.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763209/adam-store/images/rzdueqmayxmfo8fw3dat.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
21	adam-store/images/x9lbktcbtvwnoo5crokt	2.4.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763212/adam-store/images/x9lbktcbtvwnoo5crokt.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
22	adam-store/images/t3qvdo1muuckv8qwoeju	1.1.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763347/adam-store/images/t3qvdo1muuckv8qwoeju.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
23	adam-store/images/do3a4o1gzhompo4hjylh	1.2.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763349/adam-store/images/do3a4o1gzhompo4hjylh.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
24	adam-store/images/lutxjxg78e0bspbkn6wg	1.3.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763351/adam-store/images/lutxjxg78e0bspbkn6wg.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
25	adam-store/images/rbjdgl1fbyebubogmlyy	1.4.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763353/adam-store/images/rbjdgl1fbyebubogmlyy.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
26	adam-store/images/v3lmdjnphswstjwyddm8	2.1.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763565/adam-store/images/v3lmdjnphswstjwyddm8.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
27	adam-store/images/aou23efgchmtas0abm8k	2.2.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763568/adam-store/images/aou23efgchmtas0abm8k.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
28	adam-store/images/egkz7hjy304wft7nhvnh	2.3.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763571/adam-store/images/egkz7hjy304wft7nhvnh.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
29	adam-store/images/owouoi2u1jm5gp5cjbqv	2.4.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763573/adam-store/images/owouoi2u1jm5gp5cjbqv.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
30	adam-store/images/zz73btnl8ica2ywgfv8t	1.1.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763743/adam-store/images/zz73btnl8ica2ywgfv8t.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
31	adam-store/images/zlp6ee4crb3uotk5cexa	1.2.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763745/adam-store/images/zlp6ee4crb3uotk5cexa.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
32	adam-store/images/gockt3uhknf3i8qqp8ws	1.3.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763748/adam-store/images/gockt3uhknf3i8qqp8ws.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
33	adam-store/images/y7hfx18wv5pah8uoavte	1.4.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763750/adam-store/images/y7hfx18wv5pah8uoavte.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
34	adam-store/images/l9qm9c5ojajfxht1bibo	2.1.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763891/adam-store/images/l9qm9c5ojajfxht1bibo.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
35	adam-store/images/xhr0lfcny4r0hbahjtzv	2.2.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763894/adam-store/images/xhr0lfcny4r0hbahjtzv.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
36	adam-store/images/p70iuazkple9nrh2wwsx	2.3.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763896/adam-store/images/p70iuazkple9nrh2wwsx.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
37	adam-store/images/afan9ydokr5vnya9ocsf	2.4.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752763899/adam-store/images/afan9ydokr5vnya9ocsf.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
38	adam-store/images/pwvgouftx5t1baqr84tu	1.1.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752764088/adam-store/images/pwvgouftx5t1baqr84tu.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
39	adam-store/images/kpjxn9b9cvhlsyttkkvg	1.2.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752764090/adam-store/images/kpjxn9b9cvhlsyttkkvg.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
40	adam-store/images/e4wlle20j4csww1dl4ui	1.3.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752764092/adam-store/images/e4wlle20j4csww1dl4ui.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
41	adam-store/images/woh4ffevu9sdfq1dp8du	1.4.jpg	http://res.cloudinary.com/dz5wejuuf/image/upload/v1752764094/adam-store/images/woh4ffevu9sdfq1dp8du.jpg	PRODUCT_IMAGE	admin@gmail.com	2025-07-17
\.


--
-- TOC entry 3585 (class 0 OID 66320)
-- Dependencies: 214
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	create user tables	SQL	V1__create_user_tables.sql	908067790	postgres	2025-07-17 20:31:44.183959	55	t
2	2	create role tables	SQL	V2__create_role_tables.sql	1324840735	postgres	2025-07-17 20:31:44.268821	29	t
3	3	create permission tables	SQL	V3__create_permission_tables.sql	-1608763519	postgres	2025-07-17 20:31:44.313691	30	t
4	4	create address tables	SQL	V4__create_address_tables.sql	824810443	postgres	2025-07-17 20:31:44.355488	84	t
5	5	create branch tables	SQL	V5__create_branch_tables.sql	1311895496	postgres	2025-07-17 20:31:44.454356	54	t
6	6	create color tables	SQL	V6__create_color_tables.sql	-467070452	postgres	2025-07-17 20:31:44.524723	19	t
7	7	create size tables	SQL	V7__create_size_tables.sql	321971859	postgres	2025-07-17 20:31:44.552083	12	t
8	8	create file tables	SQL	V10__create_file_tables.sql	1520961341	postgres	2025-07-17 20:31:44.572376	18	t
9	9	create category tables	SQL	V8__create_category_tables.sql	-1643217532	postgres	2025-07-17 20:31:44.598996	16	t
10	10	create product tables	SQL	V9__create_product_tables.sql	110843624	postgres	2025-07-17 20:31:44.623547	78	t
11	11	create cart tables	SQL	V11__create_cart_tables.sql	508368939	postgres	2025-07-17 20:31:44.714489	26	t
12	12	create review tables	SQL	V12__create_review_tables.sql	200805201	postgres	2025-07-17 20:31:44.754004	18	t
13	13	create order tables	SQL	V13__create_order_tables.sql	-1334359747	postgres	2025-07-17 20:31:44.780524	30	t
14	14	create payment history tables	SQL	V14__create_payment_history_tables.sql	-1508694267	postgres	2025-07-17 20:31:44.82384	16	t
15	15	create promotion tables	SQL	V15__create_promotion_tables.sql	-391827037	postgres	2025-07-17 20:31:44.847928	30	t
16	16	create refresh token tables	SQL	V16__create_refresh_token_tables.sql	-501071458	postgres	2025-07-17 20:31:44.888412	11	t
\.


--
-- TOC entry 3622 (class 0 OID 66626)
-- Dependencies: 251
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, quantity, unit_price, product_variant_id, order_id) FROM stdin;
1	12	279000	3	1
2	2	299000	7	2
3	1	289000	9	2
7	1	299000	5	6
8	1	289000	9	7
9	3	299000	12	8
\.


--
-- TOC entry 3620 (class 0 OID 66608)
-- Dependencies: 249
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, order_date, total_price, order_status, updated_at, address_id, user_id) FROM stdin;
1	2025-07-17	3058200	PROCESSING	2025-07-17	1	2
2	2025-07-17	917000	PROCESSING	2025-07-17	2	2
6	2025-07-17	243000	PROCESSING	2025-07-17	1	2
7	2025-07-17	235500	PROCESSING	2025-07-17	4	4
8	2025-07-17	829800	PROCESSING	2025-07-17	5	4
\.


--
-- TOC entry 3624 (class 0 OID 66644)
-- Dependencies: 253
-- Data for Name: payment_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_history (id, is_primary, payment_method, total_amount, payment_status, payment_time, order_id) FROM stdin;
1	t	VNPAY	3058200	PAID	2025-07-17 22:07:36.925072	1
2	t	VNPAY	917000	PAID	2025-07-17 22:08:48.796662	2
3	t	VNPAY	243000	PAID	2025-07-17 22:09:40.250722	6
4	t	VNPAY	235500	PAID	2025-07-17 22:13:51.081279	7
5	t	VNPAY	829800	PAID	2025-07-17 22:14:22.772772	8
\.


--
-- TOC entry 3592 (class 0 OID 66372)
-- Dependencies: 221
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, name, module, api_path, method) FROM stdin;
\.


--
-- TOC entry 3612 (class 0 OID 66525)
-- Dependencies: 241
-- Data for Name: product_variants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variants (id, is_available, price, quantity, status, product_id, color_id, size_id, image_id) FROM stdin;
1	t	279000	100	ACTIVE	1	2	2	2
2	t	279000	100	ACTIVE	1	2	3	2
4	t	299000	100	ACTIVE	1	3	2	3
6	t	289000	100	ACTIVE	1	1	3	1
8	t	289000	100	ACTIVE	1	1	1	1
10	t	289000	100	ACTIVE	1	1	3	1
11	t	279000	100	ACTIVE	1	2	1	2
13	t	279000	100	ACTIVE	1	2	3	2
14	t	289000	100	ACTIVE	1	1	2	1
15	t	279000	100	ACTIVE	1	2	2	2
16	t	289000	100	ACTIVE	1	1	1	1
17	t	299000	100	ACTIVE	1	3	1	3
18	t	299000	100	ACTIVE	1	3	3	3
19	t	300000	100	ACTIVE	2	4	2	9
20	t	300000	100	ACTIVE	2	4	3	9
21	t	310000	100	ACTIVE	2	1	2	7
22	t	310000	100	ACTIVE	2	1	1	7
23	t	300000	100	ACTIVE	2	2	3	8
24	t	300000	100	ACTIVE	2	2	2	8
25	t	310000	100	ACTIVE	2	1	3	7
26	t	300000	100	ACTIVE	2	2	1	8
27	t	300000	100	ACTIVE	2	4	1	9
28	t	259000	100	ACTIVE	3	2	5	13
29	t	259000	100	ACTIVE	3	2	3	13
30	t	259000	100	ACTIVE	3	1	2	10
31	t	259000	100	ACTIVE	3	2	4	13
32	t	259000	100	ACTIVE	3	2	1	12
33	t	259000	100	ACTIVE	3	1	1	10
34	t	259000	100	ACTIVE	3	1	4	11
35	t	259000	100	ACTIVE	3	2	2	12
36	t	259000	100	ACTIVE	3	1	3	11
37	t	259000	100	ACTIVE	3	1	5	11
38	t	330000	100	ACTIVE	4	4	5	17
39	t	330000	100	ACTIVE	4	1	4	15
40	t	330000	100	ACTIVE	4	4	3	17
41	t	330000	100	ACTIVE	4	1	1	14
42	t	330000	100	ACTIVE	4	1	3	15
43	t	330000	100	ACTIVE	4	1	5	15
44	t	330000	100	ACTIVE	4	4	1	16
45	t	330000	100	ACTIVE	4	4	4	17
46	t	330000	100	ACTIVE	4	4	2	16
47	t	330000	100	ACTIVE	4	1	2	14
48	t	330000	100	ACTIVE	4	4	1	16
49	t	330000	100	ACTIVE	4	4	4	17
50	t	330000	100	ACTIVE	4	1	5	15
51	t	330000	100	ACTIVE	4	1	2	14
52	t	330000	100	ACTIVE	4	1	4	15
53	t	330000	100	ACTIVE	4	1	3	15
54	t	330000	100	ACTIVE	4	4	2	16
55	t	330000	100	ACTIVE	4	4	3	17
56	t	330000	100	ACTIVE	4	1	1	14
57	t	330000	100	ACTIVE	4	4	5	17
58	t	330000	100	ACTIVE	5	1	1	18
59	t	330000	100	ACTIVE	5	1	2	18
60	t	330000	100	ACTIVE	5	1	4	19
61	t	330000	100	ACTIVE	5	2	2	20
62	t	330000	100	ACTIVE	5	2	5	21
63	t	330000	100	ACTIVE	5	2	3	21
64	t	330000	100	ACTIVE	5	1	3	19
65	t	330000	100	ACTIVE	5	2	4	21
66	t	330000	100	ACTIVE	5	2	1	20
67	t	330000	100	ACTIVE	5	1	5	19
68	t	350000	100	ACTIVE	6	1	3	22
69	t	350000	100	ACTIVE	6	1	2	22
70	t	350000	100	ACTIVE	6	2	2	23
71	t	350000	100	ACTIVE	6	2	4	23
72	t	350000	100	ACTIVE	6	4	1	24
73	t	350000	100	ACTIVE	6	1	4	22
74	t	350000	100	ACTIVE	6	4	4	25
75	t	350000	100	ACTIVE	6	4	2	24
76	t	350000	100	ACTIVE	6	2	5	23
77	t	350000	100	ACTIVE	6	4	3	25
78	t	350000	100	ACTIVE	6	2	3	23
79	t	350000	100	ACTIVE	6	2	1	23
80	t	350000	100	ACTIVE	6	1	1	22
81	t	350000	100	ACTIVE	6	4	5	25
7	t	299000	98	ACTIVE	1	3	1	3
5	t	299000	99	ACTIVE	1	3	3	3
12	t	299000	97	ACTIVE	1	3	2	3
82	t	350000	100	ACTIVE	6	1	5	22
83	t	370000	100	ACTIVE	7	1	1	26
84	t	370000	100	ACTIVE	7	5	3	29
85	t	370000	100	ACTIVE	7	2	3	27
86	t	370000	100	ACTIVE	7	1	4	26
87	t	370000	100	ACTIVE	7	2	2	27
88	t	370000	100	ACTIVE	7	5	4	29
89	t	370000	100	ACTIVE	7	5	1	28
90	t	370000	100	ACTIVE	7	1	2	26
91	t	370000	100	ACTIVE	7	1	3	26
92	t	370000	100	ACTIVE	7	5	2	28
93	t	370000	100	ACTIVE	7	2	5	27
94	t	370000	100	ACTIVE	7	2	1	27
95	t	370000	100	ACTIVE	7	2	4	27
96	t	370000	100	ACTIVE	7	1	5	26
97	t	370000	100	ACTIVE	7	5	5	29
98	t	600000	100	ACTIVE	8	3	1	32
99	t	600000	100	ACTIVE	8	2	1	31
100	t	600000	100	ACTIVE	8	1	1	30
101	t	600000	100	ACTIVE	8	3	3	33
102	t	600000	100	ACTIVE	8	3	2	32
103	t	600000	100	ACTIVE	8	2	5	31
104	t	600000	100	ACTIVE	8	2	3	31
105	t	600000	100	ACTIVE	8	1	3	30
106	t	600000	100	ACTIVE	8	1	4	30
107	t	600000	100	ACTIVE	8	2	4	31
108	t	600000	100	ACTIVE	8	3	4	33
109	t	600000	100	ACTIVE	8	1	5	30
110	t	600000	100	ACTIVE	8	2	2	31
111	t	600000	100	ACTIVE	8	1	2	30
112	t	600000	100	ACTIVE	8	3	5	33
113	t	700000	100	ACTIVE	9	1	3	34
114	t	700000	100	ACTIVE	9	1	2	34
115	t	700000	100	ACTIVE	9	2	2	35
116	t	700000	100	ACTIVE	9	1	1	34
117	t	700000	100	ACTIVE	9	1	4	34
118	t	700000	100	ACTIVE	9	2	4	36
119	t	700000	100	ACTIVE	9	2	5	37
120	t	700000	100	ACTIVE	9	2	1	35
121	t	700000	100	ACTIVE	9	1	5	34
122	t	700000	100	ACTIVE	9	2	3	36
123	t	550000	100	ACTIVE	10	2	5	39
124	t	550000	100	ACTIVE	10	2	3	39
125	t	550000	100	ACTIVE	10	1	3	38
126	t	550000	100	ACTIVE	10	2	1	39
127	t	550000	100	ACTIVE	10	1	4	38
128	t	550000	100	ACTIVE	10	4	2	40
129	t	550000	100	ACTIVE	10	4	1	40
130	t	550000	100	ACTIVE	10	2	2	39
131	t	550000	100	ACTIVE	10	4	3	41
132	t	550000	100	ACTIVE	10	1	1	38
133	t	550000	100	ACTIVE	10	2	4	39
134	t	550000	100	ACTIVE	10	4	5	41
135	t	550000	100	ACTIVE	10	1	5	38
136	t	550000	100	ACTIVE	10	4	4	41
137	t	550000	100	ACTIVE	10	1	2	38
3	t	279000	88	ACTIVE	1	2	1	2
9	t	289000	98	ACTIVE	1	1	2	1
\.


--
-- TOC entry 3610 (class 0 OID 66508)
-- Dependencies: 239
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, description, is_available, sold_quantity, average_rating, total_reviews, status, created_by, updated_by, created_at, updated_at, category_id) FROM stdin;
1	Áo Sơ Mi Nam Ngắn Tay Kẻ Caro	Áo sơ mi vải flannel cao cấp, phong cách Hàn Quốc	t	0	5	0	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17	1
2	Áo Sơ Mi Nam Dài Tay Kẻ Sọc	Áo sơ mi nam dài tay với họa tiết kẻ sọc thanh lịch, phù hợp môi trường công sở.	t	0	5	0	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17	1
3	Áo Sơ Mi Nam Ngắn Tay Chấm Hoa	Áo sơ mi nam ngắn tay hoạ tiết chấm hoa trẻ trung, thích hợp mặc mùa hè.	t	0	5	0	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17	1
4	Quần Jeans Nam Regular Fit AJN0010Z	Quần jeans nam kiểu dáng regular fit, chất liệu denim bền đẹp, dễ phối đồ.	t	0	5	0	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17	3
5	Quần jeans Nam AJN0080Z	Quần jeans nam form chuẩn, chất liệu denim cao cấp, phù hợp nhiều hoàn cảnh sử dụng.	t	0	5	0	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17	3
6	Quần Short Nam Xanh Cổ Vịt Golf ASOG13AS4	Quần short nam phong cách thể thao golf, màu xanh cổ vịt trẻ trung, chất vải thoáng mát.	t	0	5	0	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17	5
7	Quần Short Âu Xanh Rêu Kẻ Nam Golf ASOG11AS2	Quần short âu nam phong cách golf, màu xanh rêu họa tiết kẻ tinh tế, phù hợp môi trường lịch sự thể thao.	t	0	5	0	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17	5
8	Áo Khoác 3 Lớp Regular Fit AJK005BZ	Áo khoác 3 lớp chống gió, giữ ấm tốt, thiết kế Regular Fit hiện đại phù hợp thời tiết lạnh.	t	0	5	0	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17	4
9	Áo khoác dạ hai lớp Nam AJK018BZ	Áo khoác dạ hai lớp sang trọng, giữ ấm tốt, phù hợp thời tiết lạnh và phong cách lịch lãm.	t	0	5	0	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17	4
10	Áo Polo Classic Nam Business Silk Tơ Tằm 1PS074AS3	Áo polo nam chất liệu tơ tằm cao cấp, thoáng mát, thấm hút tốt, kiểu dáng lịch lãm phù hợp đi làm và đi chơi.	t	0	5	0	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17	7
\.


--
-- TOC entry 3628 (class 0 OID 66666)
-- Dependencies: 257
-- Data for Name: promotion_usages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion_usages (id, discount_amount, used_at, user_id, promotion_id, order_id) FROM stdin;
1	339800	2025-07-17 22:06:16.403153	2	1	1
2	81000	2025-07-17 22:09:25.310864	2	4	6
3	78500	2025-07-17 22:13:27.702188	4	4	7
4	92200	2025-07-17 22:14:14.3826	4	1	8
\.


--
-- TOC entry 3626 (class 0 OID 66657)
-- Dependencies: 255
-- Data for Name: promotions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotions (id, code, description, discount_percent, start_date, end_date, status, created_by, updated_by, created_at, updated_at) FROM stdin;
1	WELCOME10	Giảm 10% cho khách hàng mới	10	2025-01-01	2025-12-31	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
2	FLASHSALE30	Flash Sale giảm 30% toàn bộ sản phẩm	30	2025-07-20	2025-09-30	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
3	BLACKFRIDAY50	Black Friday – Giảm 50% toàn bộ đơn hàng	50	2025-09-25	2025-11-30	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
4	SUMMERFUN25	Giảm 25% cho tất cả sản phẩm trong mùa hè rực rỡ	25	2025-06-01	2025-08-31	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
5	HOTDEAL30	Ưu đãi mùa hè - giảm ngay 30% khi mua từ 2 sản phẩm	30	2025-07-01	2025-07-31	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
6	HELLOJULY15	Tháng 7 rực nắng - Giảm ngay 15% toàn bộ sản phẩm	15	2025-07-01	2025-07-31	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
7	SUMMERFEST40	Summer Festival - Giảm cực sốc 40% các mặt hàng thời trang	40	2025-06-20	2025-07-25	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
\.


--
-- TOC entry 3594 (class 0 OID 66401)
-- Dependencies: 223
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provinces (id, name) FROM stdin;
269	Lào Cai
268	Hưng Yên
267	Hòa Bình
266	Sơn La
265	Điện Biên
264	Lai Châu
263	Yên Bái
262	Bình Định
261	Ninh Thuận
260	Phú Yên
259	Kon Tum
258	Bình Thuận
253	Bạc Liêu
252	Cà Mau
250	Hậu Giang
249	Bắc Ninh
248	Bắc Giang
247	Lạng Sơn
246	Cao Bằng
245	Bắc Kạn
244	Thái Nguyên
243	Quảng Nam
242	Quảng Ngãi
241	Đắk Nông
240	Tây Ninh
239	Bình Phước
238	Quảng Trị
237	Quảng Bình
236	Hà Tĩnh
235	Nghệ An
234	Thanh Hóa
233	Ninh Bình
232	Hà Nam
231	Nam Định
230	Quảng Ninh
229	Phú Thọ
228	Tuyên Quang
227	Hà Giang
226	Thái Bình
225	Hải Dương
224	Hải Phòng
223	Thừa Thiên Huế
221	Vĩnh Phúc
220	Cần Thơ
219	Kiên Giang
218	Sóc Trăng
217	An Giang
216	Đồng Tháp
215	Vĩnh Long
214	Trà Vinh
213	Bến Tre
212	Tiền Giang
211	Long An
210	Đắk Lắk
209	Lâm Đồng
208	Khánh Hòa
207	Gia Lai
206	Bà Rịa - Vũng Tàu
205	Bình Dương
204	Đồng Nai
203	Đà Nẵng
202	Hồ Chí Minh
201	Hà Nội
\.


--
-- TOC entry 3630 (class 0 OID 66691)
-- Dependencies: 259
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refresh_tokens (id, token, expiry_date) FROM stdin;
1	eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbkBnbWFpbC5jb20iLCJyb2xlcyI6WyJBRE1JTiJdLCJpc3MiOiJBZG1pbiIsImV4cCI6MTc1NDQ4NzI2NSwiaWF0IjoxNzUyNzU5MjY1LCJqdGkiOiI4NjBjOTkyNi02NmFjLTQ0OGUtYWY5NC1mYTE0MDFjYTMwZTMifQ.elnm_L_2ouxMR8JiEwkfvorXCiUBVUIcHvG30k_0OfOl9HlcKJ4aYxHgGTeXzLwTTXaye5qhbmRNatn2kibGlA	2025-08-06 20:34:25.925135
2	eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbmphdmEyNzA4MDRAZ21haWwuY29tIiwicm9sZXMiOlsiVVNFUiJdLCJpc3MiOiJBbiBKYXZhIiwiZXhwIjoxNzU0NDg3Mzk5LCJpYXQiOjE3NTI3NTkzOTksImp0aSI6IjJkYzcyYjEzLTQ3NGQtNDRjYS1iYjUzLWE2OTI3MTdhNTQ4OCJ9.AwvlzV3RpbIMiFGaEqLx3_dXl8c6b20W8MvKo8DOTNpSfwDSfV-kJy7XYciFuL-Z1CLsu2g8eycTnh9ZKdPWYA	2025-08-06 20:36:39.824951
3	eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ0aHV5ZHVuZzIxMDMwNUBnbWFpbC5jb20iLCJyb2xlcyI6WyJVU0VSIl0sImlzcyI6IlRow7l5IER1bmciLCJleHAiOjE3NTQ0ODc0NDEsImlhdCI6MTc1Mjc1OTQ0MSwianRpIjoiMDE1ZjgxNjEtMjUyYy00YWMwLTg3YmYtODRlNzUyZDI5ZTVmIn0.4HB4Nz9xsqnaYIEUBda7MC1oveBvs7tXBS1zkP8gPQHrjWd5RYyok7yb73xi9HPjNQxtZvg8t7RiRn7ZMAZQMQ	2025-08-06 20:37:21.906913
4	eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJsZWFuMjcwODA0QGdtYWlsLmNvbSIsInJvbGVzIjpbIkFETUlOIiwiVVNFUiJdLCJpc3MiOiJMw6ogVsSDbiBBbiIsImV4cCI6MTc1NDQ5MjIzMCwiaWF0IjoxNzUyNzY0MjMwLCJqdGkiOiIyODc2MGEzYS0wZWY3LTRlMjYtYmIzNy1jNWI2NTM3ZmU1YjYifQ.D779PGts4ZLEVD4AeJuil1cu-C9Pv03fh2DrCDxoEwQbLYh0_JdekmrFWnnO1gusaOoFpCMsbR4vdDMeA6b1wQ	2025-08-06 21:57:10.171812
5	eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ0aHV5ZHVuZzIxMDMwNUBnbWFpbC5jb20iLCJyb2xlcyI6WyJVU0VSIl0sImlzcyI6IlRow7l5IER1bmciLCJleHAiOjE3NTQ0OTMwMDEsImlhdCI6MTc1Mjc2NTAwMSwianRpIjoiMDVlOWFkZjItMmE5ZS00NDVkLThjMmUtNWZjZTYwNTFlN2U0In0.Kdo-n8LLwz8KcFKtxgDyWZJQdYR1f6p70cDMJ-rK0-DcnOHh3Ixyg4GYCRNWxf_5WH36pOna7GFfquo7669Gjw	2025-08-06 22:10:01.350453
\.


--
-- TOC entry 3618 (class 0 OID 66587)
-- Dependencies: 247
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, rating, comment, image_urls, created_at, updated_at, user_id, product_id) FROM stdin;
\.


--
-- TOC entry 3593 (class 0 OID 66384)
-- Dependencies: 222
-- Data for Name: role_has_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_has_permission (role_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3589 (class 0 OID 66344)
-- Dependencies: 218
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, description, created_at, updated_at) FROM stdin;
1	USER	ROLE_USER	\N	\N
2	ADMIN	ROLE_ADMIN	\N	\N
\.


--
-- TOC entry 3604 (class 0 OID 66479)
-- Dependencies: 233
-- Data for Name: sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sizes (id, name) FROM stdin;
1	XS
2	S
3	M
4	L
5	XL
6	XXL
7	XXXL
\.


--
-- TOC entry 3590 (class 0 OID 66354)
-- Dependencies: 219
-- Data for Name: user_has_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_has_role (user_id, role_id, state) FROM stdin;
1	2	ACTIVE
2	1	ACTIVE
2	2	ACTIVE
3	1	ACTIVE
4	1	ACTIVE
\.


--
-- TOC entry 3587 (class 0 OID 66330)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, avatar_url, dob, gender, status, created_by, updated_by, created_at, updated_at) FROM stdin;
1	Admin	admin@gmail.com	$2a$10$WxS5dTy8Gcg.nVtjKoZEjOiniqSoJecbMmDlZ3R99UmIlA9K7L74K	\N	2025-07-17	MALE	ACTIVE	\N	\N	2025-07-17	2025-07-17
2	Lê Văn An	lean270804@gmail.com	$2a$10$rqA88DrygKNUyUj/DhY0uO2N8yX.4rIWhj3j9l.ZGpYZ1mfZpzbe.	\N	\N	\N	ACTIVE	admin@gmail.com	admin@gmail.com	2025-07-17	2025-07-17
3	An Java	anjava270804@gmail.com	$2a$10$cN6sgXUS4sXHOxvPgw5EHumexF.YhDwrz7Sj5OvXdDwuncfeiZy5m	\N	\N	\N	ACTIVE	anonymousUser	anonymousUser	2025-07-17	2025-07-17
4	Thùy Dung	thuydung210305@gmail.com	$2a$10$9tZFrz1LAnU3qvE2rDq9qelQupk.J7GBJsNkxQwn6cqDDGiWTRde.	\N	\N	\N	ACTIVE	anonymousUser	anonymousUser	2025-07-17	2025-07-17
\.


--
-- TOC entry 3596 (class 0 OID 66417)
-- Dependencies: 225
-- Data for Name: wards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wards (code, name, district_id) FROM stdin;
90816	Thị Trấn Si Ma Cai	2264
80213	Xã Thào Chư Phìn	2264
80212	Xã Sín Chéng	2264
80211	Xã Si Ma Cai	2264
80210	Xã Sán Chải	2264
80209	Xã Quan Thần Sán	2264
80208	Xã Nàn Xín	2264
80207	Xã Nàn Sán	2264
80206	Xã Mản Thẩn	2264
80205	Xã Lùng Sui	2264
80204	Xã Lử Thẩn	2264
80203	Xã Cán Hồ	2264
80202	Xã Cán Cấu	2264
80201	Xã Bản Mế	2264
800249	Xã Quan Hồ Thẩn	2264
800248	Xã Lùng Thẩn	2264
80916	Xã Tung Chung Phố	2171
80915	Xã Thanh Bình	2171
80914	Xã Tả Thàng	2171
80913	Xã Tả Ngải Chồ	2171
80912	Xã Tả Gia Khâu	2171
80911	Xã Pha Long	2171
80910	Xã Nấm Lư	2171
80909	Xã Nậm Chảy	2171
80908	Xã Lùng Vai	2171
80907	Xã Lùng Khấu Nhin	2171
80906	Xã La Pan Tẩn	2171
80905	Xã Dìn Chin	2171
80904	Xã Cao Sơn	2171
80903	Xã Bản Sen	2171
80902	Xã Bản Lầu	2171
80901	Thị trấn Mường Khương	2171
80415	Xã Xuân Quang	2073
80414	Xã Xuân Giao	2073
80413	Xã Trì Quang	2073
80412	Xã Thái Niên	2073
80411	Xã Sơn Hải	2073
80410	Xã Sơn Hà	2073
80409	Xã Phú Nhuận	2073
80408	Xã Phong Niên	2073
80407	Xã Phố Lu	2073
80406	Xã Gia Phú	2073
80405	Xã Bản Phiệt	2073
80404	Xã Bản Cầm	2073
80403	Thị trấn Tằng Loỏng	2073
80402	Thị trấn Phố Lu	2073
80401	Thị trấn N.T Phong Hải	2073
80623	Xã Võ Lao	2043
80622	Xã Văn Sơn	2043
80621	Xã Thẩm Dương	2043
80620	Xã Tân Thượng	2043
80619	Xã Tân An	2043
80618	Xã Sơn Thuỷ	2043
80617	Xã Nậm Xé	2043
80616	Xã Nậm Xây	2043
80615	Xã Nậm Tha	2043
80614	Xã Nậm Rạng	2043
80613	Xã Nậm Mả	2043
80612	Xã Nậm Chầy	2043
80611	Xã Minh Lương	2043
80610	Xã Liêm Phú	2043
80609	Xã Làng Giàng	2043
80608	Xã Khánh Yên Trung	2043
80607	Xã Khánh Yên Thượng	2043
80606	Xã Khánh Yên Hạ	2043
80605	Xã Hoà Mạc	2043
80604	Xã Dương Quỳ	2043
80603	Xã Dần Thàng	2043
80602	Xã Chiềng Ken	2043
80601	Thị trấn Khánh Yên	2043
80518	Xã Trung Chải	2005
80517	Xã Thanh Phú	2005
80516	Xã Thanh Kim	2005
80515	Xã Tả Van	2005
80514	Xã Tả Phìn	2005
80513	Xã Tả Giàng Phình	2005
80512	Xã Suối Thầu	2005
80511	Xã Sử Pán	2005
80510	Xã San Sả Hồ	2005
80509	Xã Sa Pả	2005
80508	Xã Nậm Sài	2005
80507	Xã Nậm Cang	2005
80506	Xã Lao Chải	2005
80505	Xã Hầu Thào	2005
80504	Xã Bản Phùng	2005
80503	Xã Bản Khoang	2005
80502	Xã Bản Hồ	2005
80501	Phường Sa Pa	2005
800168	Phường Ô Quý Hồ	2005
800167	Xã Thanh Bình	2005
800166	Phường Phan Si Păng	2005
800165	Xã Ngũ Chỉ Sơn	2005
800164	Xã Mường Hoa	2005
800163	Xã Mường Bo	2005
800162	Xã Liên Minh	2005
800161	Phường Hàm Rồng	2005
800160	Xã Hoàng Liên	2005
800159	Phường Cầu Mây	2005
80821	Xã Thải Giàng Phố	1892
80820	Xã Tả Van Chư	1892
80819	Xã Tả Củ Tỷ	1892
80818	Xã Tà Chải	1892
80817	Xã Nậm Mòn	1892
80816	Xã Nậm Lúc	1892
80815	Xã Nậm Khánh	1892
80814	Xã Nậm Đét	1892
80813	Xã Na Hối	1892
80812	Xã Lùng Phình	1892
80811	Xã Lùng Cải	1892
80810	Xã Lầu Thí Ngài	1892
80809	Xã Hoàng Thu Phố	1892
80808	Xã Cốc Ly	1892
80807	Xã Cốc Lầu	1892
80806	Xã Bảo Nhai	1892
80805	Xã Bản Phố	1892
80804	Xã Bản Liền	1892
80803	Xã Bản Già	1892
80802	Xã Bản Cái	1892
80801	Thị trấn Bắc Hà	1892
80718	Xã Yên Sơn	1891
80717	Xã Xuân Thượng	1891
80716	Xã Xuân Hoà	1891
80715	Xã Vĩnh Yên	1891
80714	Xã Việt Tiến	1891
80713	Xã Thượng Hà	1891
80712	Xã Tân Tiến	1891
80711	Xã Tân Dương	1891
80710	Xã Nghĩa Đô	1891
80709	Xã Minh Tân	1891
80708	Xã Lương Sơn	1891
80707	Xã Long Phúc	1891
80706	Xã Long Khánh	1891
80705	Xã Kim Sơn	1891
80704	Xã Điện Quan	1891
80703	Xã Cam Cọn	1891
80702	Xã Bảo Hà	1891
80701	Thị trấn Phố Ràng	1891
800250	Xã Phúc Khánh	1891
80323	Xã Y Tý	1744
80322	Xã Trung Lèng Hồ	1744
80321	Xã Trịnh Tường	1744
80320	Xã Tòng Sành	1744
80319	Xã Sàng Ma Sáo	1744
80318	Xã Quang Kim	1744
80317	Xã Phìn Ngan	1744
80316	Xã Pa Cheo	1744
80315	Xã Ngải Thầu	1744
80314	Xã Nậm Pung	1744
80313	Xã Nậm Chạc	1744
80312	Xã Mường Vi	1744
80311	Xã Mường Hum	1744
80310	Xã Dền Thàng	1744
80309	Xã Dền Sáng	1744
80308	Xã Cốc San	1744
80307	Xã Cốc Mỳ	1744
80306	Xã Bản Xèo	1744
80305	Xã Bản Vược	1744
80304	Xã Bản Qua	1744
80303	Xã A Mú Sung	1744
80302	Xã A Lù	1744
80301	Thị trấn Bát Xát	1744
80117	Xã Vạn Hoà	1682
80116	Xã Tả Phời	1682
80115	Xã Hợp Thành	1682
80114	Xã Đồng Tuyển	1682
80113	Xã Cam Đường	1682
80112	Phường Xuân Tăng	1682
80111	Phường Thống Nhất	1682
80110	Phường Pom Hán	1682
80109	Phường Phố Mới	1682
80108	Phường Nam Cường	1682
80107	Phường Lào Cai	1682
80106	Phường Kim Tân	1682
80105	Phường Duyên Hải	1682
80104	Phường Cốc Lếu	1682
80103	Phường Bình Minh	1682
80102	Phường Bắc Lệnh	1682
80101	Phường Bắc Cường	1682
800247	Xã Cốc San	1682
220714	Xã Tống Trân	2194
220713	Xã Tống Phan	2194
220712	Xã Tiền Tiến	2194
220711	Xã Tam Đa	2194
220710	Xã Quang Hưng	2194
220709	Xã Phan Sào Nam	2194
220708	Xã Nhật Quang	2194
220707	Xã Nguyên Hòa	2194
220706	Xã Minh Tiến	2194
220705	Xã Minh Tân	2194
220704	Xã Minh Hoàng	2194
220703	Xã Đoàn Đào	2194
220702	Xã Đình Cao	2194
220701	Thị trấn Trần Cao	2194
220911	Xã Việt Hưng	2046
220910	Xã Trưng Trắc	2046
220909	Xã Tân Quang	2046
220908	Xã Minh Hải	2046
220907	Xã Lương Tài	2046
220906	Xã Lạc Hồng	2046
220905	Xã Lạc Đạo	2046
220904	Xã Đình Dù	2046
220903	Xã Đại Đồng	2046
220902	Xã Chỉ Đạo	2046
220901	Thị trấn Như Quỳnh	2046
221011	Xã Xuân Quan	2045
221010	Xã Vĩnh Khúc	2045
221009	Xã Thắng Lợi	2045
221008	Xã Tân Tiến	2045
221007	Xã Phụng Công	2045
221006	Xã Nghĩa Trụ	2045
221005	Xã Mễ Sở	2045
221004	Xã Long Hưng	2045
221003	Xã Liên Nghĩa	2045
221002	Xã Cửu Cao	2045
221001	Thị trấn Văn Giang	2045
91395	Xã Hải Thắng	2018
800058	Xã Minh Phượng	2018
220615	Xã Trung Dũng	2018
220614	Xã Thụy Lôi	2018
220613	Xã Thủ Sỹ	2018
220612	Xã Thiện Phiến	2018
220611	Xã Nhật Tân	2018
220610	Xã Ngô Quyền	2018
220609	Xã Minh Phương	2018
220608	Xã Lệ Xá	2018
220607	Xã Hưng Đạo	2018
220606	Xã Hải Triều	2018
220605	Xã Đức Thắng	2018
220604	Xã Dị Chế	2018
220603	Xã Cương Chính	2018
220602	Xã An Viên	2018
220601	Thị trấn Vương	2018
91389	Xã Tân Minh	1828
91388	Xã Việt Yên	1828
91387	Xã Nguyễn Văn Linh	1828
220517	Xã Yên Phú	1828
220516	Xã Yên Hòa	1828
220515	Xã Việt Cường	1828
220514	Xã Trung Hưng	1828
220513	Xã Trung Hòa	1828
220512	Xã Thanh Long	1828
220511	Xã Tân Việt	1828
220510	Xã Tân Lập	1828
220509	Xã Ngọc Long	1828
220508	Xã Nghĩa Hiệp	1828
220507	Xã Minh Châu	1828
220506	Xã Lý Thường Kiệt	1828
220505	Xã Liêu Xá	1828
220504	Xã Hoàn Long	1828
220503	Xã Giai Phạm	1828
220502	Xã Đồng Than	1828
220501	Thị trấn Yên Mỹ	1828
220813	Xã Xuân Dục	1827
220812	Xã Phùng Chí Kiên	1827
220811	Xã Phan Đình Phùng	1827
220810	Xã Nhân Hòa	1827
220809	Xã Ngọc Lâm	1827
220808	Xã Minh Đức	1827
220807	Xã Hưng Long	1827
220806	Xã Hòa Phong	1827
220805	Xã Dương Quang	1827
220804	Xã Dị Sử	1827
220803	Xã Cẩm Xá	1827
220802	Xã Bạch Sam	1827
220801	Phường Bần Yên Nhân	1827
91392	Xã Nguyễn Huệ	1826
91391	Xã Chí Minh	1826
91390	Xã Phạm Hồng Thái	1826
220425	Xã Việt Hòa	1826
220424	Xã Tứ Dân	1826
220423	Xã Thuần Hưng	1826
220422	Xã Thành Công	1826
220421	Xã Tân Dân	1826
220420	Xã Tân Châu	1826
220419	Xã Phùng Hưng	1826
220418	Xã Ông Đình	1826
220417	Xã Nhuế Dương	1826
220416	Xã Liên Khê	1826
220415	Xã Hồng Tiến	1826
220414	Xã Hàm Tử	1826
220413	Xã Đồng Tiến	1826
220412	Xã Đông Tảo	1826
220411	Xã Đông Ninh	1826
220410	Xã Đông Kết	1826
220409	Xã Dân Tiến	1826
220408	Xã Đại Tập	1826
220407	Xã Đại Hưng	1826
220406	Xã Dạ Trạch	1826
220405	Xã Chí Tân	1826
220404	Xã Bình Minh	1826
220403	Xã Bình Kiều	1826
220402	Xã An Vĩ	1826
220401	Thị trấn Khoái Châu	1826
220321	Xã Xuân Trúc	1825
220320	Xã Văn Nhuệ	1825
220319	Xã Vân Du	1825
220318	Xã Tiền Phong	1825
220317	Xã Tân Phúc	1825
220316	Xã Quang Vinh	1825
220315	Xã Quảng Lãng	1825
220314	Xã Phù Ủng	1825
220313	Xã Nguyễn Trãi	1825
220312	Xã Hồng Vân	1825
220311	Xã Hồng Quang	1825
220310	Xã Hoàng Hoa Thám	1825
220309	Xã Hồ Tùng Mậu	1825
220308	Xã Hạ Lễ	1825
220307	Xã Đào Dương	1825
220306	Xã Đặng Lễ	1825
220305	Xã Đa Lộc	1825
220304	Xã Cẩm Ninh	1825
220303	Xã Bãi Sậy	1825
220302	Xã Bắc Sơn	1825
220301	Thị trấn Ân Thi	1825
91394	Xã Diên Hồng	1717
91393	Xã Phú Thọ	1717
220217	Xã Vũ Xá	1717
220216	Xã Vĩnh Xá	1717
220215	Xã Toàn Thắng	1717
220214	Xã Thọ Vinh	1717
220213	Xã Song Mai	1717
220212	Xã Phú Thịnh	1717
220211	Xã Phạm Ngũ Lão	1717
220210	Xã Nhân La	1717
220209	Xã Ngọc Thanh	1717
220208	Xã Nghĩa Dân	1717
220207	Xã Mai Động	1717
220206	Xã Hùng An	1717
220205	Xã Hiệp Cường	1717
220204	Xã Đức Hợp	1717
220203	Xã Đồng Thanh	1717
220202	Xã Chính Nghĩa	1717
220201	Thị trấn Lương Bằng	1717
91386	Xã Phương Nam	1680
220117	Xã Trung Nghĩa	1680
220116	Xã Tân Hưng	1680
220115	Xã Quảng Châu	1680
220114	Xã Phương Chiểu	1680
220113	Xã Phú Cường	1680
220112	Xã Liên Phương	1680
220111	Xã Hùng Cường	1680
220110	Xã Hồng Nam	1680
220109	Xã Hoàng Hanh	1680
220108	Xã Bảo Khê	1680
220107	Phường Quang Trung	1680
220106	Phường Minh Khai	1680
220105	Phường Lê Lợi	1680
220104	Phường Lam Sơn	1680
220103	Phường Hồng Châu	1680
220102	Phường Hiến Nam	1680
220101	Phường An Tảo	1680
231013	Xã Yên Trị	2270
231012	Xã Yên Lạc	2270
231011	Xã Phú Lai	2270
231010	Xã Ngọc Lương	2270
231009	Xã Lạc Thịnh	2270
231008	Xã Lạc Sỹ	2270
231007	Xã Lạc Lương	2270
231006	Xã Lạc Hưng	2270
231005	Xã Hữu Lợi	2270
231004	Xã Đoàn Kết	2270
231003	Xã Đa Phúc	2270
231002	Xã Bảo Hiệu	2270
231001	Thị trấn Hàng Trạm	2270
90777	Xã Thanh Sơn	2163
800052	Xã Đồng Tân	2163
800051	Xã Tân Thành	2163
800050	Xã Thành Sơn	2163
800049	Xã Sơn Thủy	2163
230323	Xã Vạn Mai	2163
230322	Xã Tòng Đậu	2163
230321	Xã Thung Khe	2163
230320	Xã Tân Sơn	2163
230319	Xã Tân Mai	2163
230318	Xã Tân Dân	2163
230317	Xã Săm Khóe	2163
230316	Xã Pù Pin	2163
230315	Xã Piềng Vế	2163
230314	Xã Phúc Sạn	2163
230313	Xã Pà Cò	2163
230312	Xã Nong Luông	2163
230311	Xã Nà Phòn	2163
230310	Xã Nà Mèo	2163
230309	Xã Mai Hịch	2163
230308	Xã Mai Hạ	2163
230307	Xã Hang Kia	2163
230306	Xã Đồng Bảng	2163
230305	Xã Cun Pheo	2163
230304	Xã Chiềng Châu	2163
230303	Xã Bao La	2163
230302	Xã Ba Khan	2163
230301	Thị trấn Mai Châu	2163
800048	Xã Thống Nhất	2157
800047	Xã Phú Nghĩa	2157
800046	Thị Trấn Ba Hàng Đồi	2157
230915	Xã Yên Bồng	2157
230914	Xã Thanh Nông	2157
230913	Xã Phú Thành	2157
230912	Xã Phú Lão	2157
230911	Xã Liên Hòa	2157
230910	Xã Lạc Long	2157
230909	Xã Khoan Dụ	2157
230908	Xã Hưng Thi	2157
230907	Xã Đồng Tâm	2157
230906	Xã Đồng Môn	2157
230905	Xã Cố Nghĩa	2157
230904	Xã An Lạc	2157
230903	Xã An Bình	2157
230902	Thị trấn Thanh Hà	2157
230901	Thị Trấn Chi Nê	2157
800045	Xã Vũ Bình	2156
800044	Xã Quyết Thắng	2156
230529	Xã Yên Phú	2156
230528	Xã Yên Nghiệp	2156
230527	Xã Xuất Hóa	2156
230526	Xã Vũ Lâm	2156
230525	Xã Văn Sơn	2156
230524	Xã Văn Nghĩa	2156
230523	Xã Tuân Đạo	2156
230522	Xã Tự Do	2156
230521	Xã Thượng Cốc	2156
230520	Xã Tân Mỹ	2156
230519	Xã Tân Lập	2156
230518	Xã Quý Hòa	2156
230517	Xã Phúc Tuy	2156
230516	Xã Phú Lương	2156
230515	Xã Nhân Nghĩa	2156
230514	Xã Ngọc Sơn	2156
230513	Xã Ngọc Lâu	2156
230512	Xã Mỹ Thành	2156
230511	Xã Miền Đồi	2156
230510	Xã Liên Vũ	2156
230509	Xã Hương Nhượng	2156
230508	Xã Định Cư	2156
230507	Xã Chí Thiện	2156
230506	Xã Chí Đạo	2156
230505	Xã Bình Hẻm	2156
230504	Xã Bình Chân	2156
230503	Xã Bình Cảng	2156
230502	Xã Ân Nghĩa	2156
230501	Thị trấn Vụ Bản	2156
90845	Xã Mỵ Hoà	2146
800040	Xã Xuân Thủy	2146
800039	Xã Kim Lập	2146
800038	Xã Hợp Tiến	2146
800037	Xã Hùng Sơn	2146
230828	Xã Vĩnh Tiến	2146
230827	Xã Vĩnh Đồng	2146
230826	Xã Tú Sơn	2146
230825	Xã Trung Bì	2146
230824	Xã Thượng Tiến	2146
230823	Xã Thượng Bì	2146
230822	Xã Sơn Thủy	2146
230821	Xã Sào Báy	2146
230820	Xã Nuông Dăm	2146
230819	Xã Nật Sơn	2146
230818	Xã Nam Thượng	2146
230817	Xã Mi Hòa	2146
230816	Xã Lập Chiệng	2146
230815	Xã Kim Truy	2146
230814	Xã Kim Tiến	2146
230813	Xã Kim Sơn	2146
230812	Xã Kim Bôi	2146
230811	Xã Kim Bình	2146
230810	Xã Hùng Tiến	2146
230809	Xã Hợp Kim	2146
230808	Xã Hợp Đồng	2146
230807	Xã Hạ Bì	2146
230806	Xã Đú Sáng	2146
230805	Xã Đông Bắc	2146
230804	Xã Cuối Hạ	2146
230803	Xã Bình Sơn	2146
230802	Xã  Bắc Sơn	2146
230801	Thị trấn Bo	2146
800036	Xã Thạch Yên	2087
800035	Xã Hợp Phong	2087
231113	Xã Yên Thượng	2087
231112	Xã Yên Lập	2087
231111	Xã Xuân Phong	2087
231110	Xã Thung Nai	2087
231109	Xã Thu Phong	2087
231108	Xã Tây Phong	2087
231107	Xã Tân Phong	2087
231106	Xã Nam Phong	2087
231105	Xã Dũng Phong	2087
231104	Xã Đông Phong	2087
231103	Xã Bình Thanh	2087
231102	Xã Bắc Phong	2087
231101	Thị trấn Cao Phong	2087
90778	Thị Trấn Mãn Đức	2014
800055	Xã Vân Sơn	2014
800054	Xã Suối Hoa	2014
800053	Xã Nhân Mỹ	2014
230424	Xã Tuân Lộ	2014
230423	Xã Tử Nê	2014
230422	Xã Trung Hòa	2014
230421	Xã Thanh Hối	2014
230420	Xã Quyết Chiến	2014
230419	Xã Quy Mỹ	2014
230418	Xã Quy Hậu	2014
230417	Xã Phú Vinh	2014
230416	Xã Phú Cường	2014
230415	Xã Phong Phú	2014
230414	Xã Ngòi Hoa	2014
230413	Xã Ngọc Mỹ	2014
230412	Xã Ngổ Luông	2014
230411	Xã Nam Sơn	2014
230410	Xã Mỹ Hòa	2014
230409	Xã Mãn Đức	2014
230408	Xã Lũng Vân	2014
230407	Xã Lỗ Sơn	2014
230406	Xã Gia Mô	2014
230405	Xã Đông Lai	2014
230404	Xã Do Nhân	2014
230403	Xã Địch Giáo	2014
230402	Xã Bắc Sơn	2014
230401	Thị trấn Mường Khến	2014
800043	Xã Thanh Sơn	1968
800042	Xã Thanh Cao	1968
800041	Xã Cao Sơn	1968
230720	Xã Trường Sơn	1968
230719	Xã Trung Sơn	1968
230718	Xã Tiến Sơn	1968
230717	Xã Thanh Lương	1968
230716	Xã Thành Lập	1968
230715	Xã Tân Vinh	1968
230714	Xã Tân Thành	1968
230713	Xã Nhuận Trạch	1968
230712	Xã Long Sơn	1968
230711	Xã Liên Sơn	1968
230710	Xã Lâm Sơn	1968
230709	Xã Hợp Thanh	1968
230708	Xã Hợp Hòa	1968
230707	Xã Hợp Châu	1968
230706	Xã Hòa Sơn	1968
230705	Xã Cư Yên	1968
230704	Xã Cao Thắng	1968
230703	Xã Cao Răm	1968
230702	Xã Cao Dương	1968
230701	Thị trấn Lương Sơn	1968
230610	Xã Yên Quang	1955
230609	Xã Phúc Tiến	1955
230608	Xã Phú Minh	1955
230607	Xã Mông Hóa	1955
230606	Xã Hợp Thịnh	1955
230605	Xã Hợp Thành	1955
230604	Xã Độc Lập	1955
230603	Xã Dân Hòa	1955
230602	Xã Dân Hạ	1955
230601	Thị trấn Kỳ Sơn	1955
800057	Xã Tú Lý	1916
800056	Xã Nánh Nghê	1916
230220	Xã Yên Hòa	1916
230219	Xã Vầy Nưa	1916
230218	Xã Tu Lý	1916
230217	Xã Trung Thành	1916
230216	Xã Toàn Sơn	1916
230215	Xã Tiền Phong	1916
230214	Xã Tân Pheo	1916
230213	Xã Tân Minh	1916
230212	Xã Suối Nánh	1916
230211	Xã Mường Tuổng	1916
230210	Xã Mường Chiềng	1916
230209	Xã Hiền Lương	1916
230208	Xã Hào Lý	1916
230207	Xã Giáp Đắt	1916
230206	Xã Đồng Ruộng	1916
230205	Xã Đồng Nghê	1916
230204	Xã Đồng Chum	1916
230203	Xã Đoàn Kết	1916
230202	Xã Cao Sơn	1916
230201	Thị trấn Đà Bắc	1916
90796	Phường Quỳnh Lâm	1678
800261	Xã Thịnh Minh	1678
800260	Phường Kỳ Sơn	1678
800178	Xã Độc Lập	1678
800177	Xã Quang Tiến	1678
800176	Xã Phú Minh	1678
800175	Xã Mông Hóa	1678
800174	Xã Hợp Thịnh	1678
800173	Xã Hợp Thành	1678
230115	Xã Yên Mông	1678
230114	Phường Trung Minh	1678
230113	Phường Thống Nhất	1678
230112	Xã Thái Thịnh	1678
230111	Xã Sủ Ngòi	1678
230110	Xã Hòa Bình	1678
230109	Phường Dân Chủ	1678
230108	Phường Thịnh Lang	1678
230107	Phường Thái Bình	1678
230106	Phường Tân Thịnh	1678
230105	Phường Tân Hòa	1678
230104	Phường Phương Lâm	1678
230103	Phường Hữu Nghị	1678
230102	Phường Đồng Tiến	1678
230101	Phường Chăm Mát	1678
800118	Xã Sốp Cộp	3266
141108	Xã Xốp Cộp	3266
141107	Xã Sam Kha	3266
141106	Xã Púng Bánh	3266
141105	Xã Nậm Lạnh	3266
141104	Xã Mường Và	3266
141103	Xã Mường Lèo	3266
141102	Xã Mường Lạn	3266
141101	Xã Dồm Cang	3266
140316	Xã Tạ Bú	3230
140315	Xã Pi Toong	3230
140314	Xã Ngọc Chiến	3230
140313	Xã Nậm Păm	3230
140312	Xã Nậm Giôn	3230
140311	Xã Mường Trai	3230
140310	Xã Mường Chùm	3230
140309	Xã Mường Bú	3230
140308	Xã Hua Trai	3230
140307	Xã Chiềng San	3230
140306	Xã Chiềng Muôn	3230
140305	Xã Chiềng Lao	3230
140304	Xã Chiềng Hoa	3230
140303	Xã Chiềng Công	3230
140302	Xã Chiềng Ân	3230
140301	Thị trấn Ít Ong	3230
140815	Xã Yên Sơn	2267
140814	Xã Viêng Lán	2267
140813	Xã Tú Nang	2267
140812	Xã Sặp Vạt	2267
140811	Xã Phiêng Khoài	2267
140810	Xã Mường Lựm	2267
140809	Xã Lóng Phiêng	2267
140808	Xã Chiềng Tương	2267
140807	Xã Chiềng Sàng	2267
140806	Xã Chiềng Pằn	2267
140805	Xã Chiềng On	2267
140804	Xã Chiềng Khoi	2267
140803	Xã Chiềng Hặc	2267
140802	Xã Chiềng Đông	2267
140801	Thị trấn Yên Châu	2267
141214	Xã Xuân Nha	2255
141213	Xã Vân Hồ	2255
141212	Xã Tô Múa	2255
141211	Xã Tân Xuân	2255
141210	Xã Suối Bàng	2255
141209	Xã Song Khủa	2255
141208	Xã Quang Minh	2255
141207	Xã Mường Tè	2255
141206	Xã Mường Men	2255
141205	Xã Lóng Luông	2255
141204	Xã Liên Hoà	2255
141203	Xã Chiềng Yên	2255
141202	Xã Chiềng Xuân	2255
141201	Xã Chiềng Khoa	2255
140211	Xã Pá Ma Pha Khinh	2204
140210	Xã Nậm ét	2204
140209	Xã Mường Sại	2204
140208	Xã Mường Giôn	2204
140207	Xã Mường Giàng	2204
140206	Xã Mường Chiên	2204
140205	Xã Chiềng Ơn	2204
140204	Xã Chiềng Khoang	2204
140203	Xã Chiềng Khay	2204
140202	Xã Chiềng Bằng	2204
140201	Xã Cà Nàng	2204
140516	Xã Xím Vàng	2079
140515	Xã Tà Xùa	2079
140514	Xã Tạ Khoa	2079
140513	Xã Song Pe	2079
140512	Xã Phiêng Côn	2079
140511	Xã Phiêng Ban	2079
140510	Xã Mường Khoa	2079
140509	Xã Làng Chếu	2079
140508	Xã Hua Nhàn	2079
140507	Xã Hồng Ngài	2079
140506	Xã Háng Đồng	2079
140505	Xã Hang Chú	2079
140504	Xã Chim Vàn	2079
140503	Xã Chiềng Sại	2079
140502	Xã Pắc Ngà	2079
140501	Thị trấn Bắc Yên	2079
91285	Xã Phổng Ly	2032
800120	Xã Tông Lạnh	2032
800119	Xã Phổng Lăng	2032
140429	Xã Tòng Lệnh	2032
140428	Xã Tòng Cọ	2032
140427	Xã Thôm Mòn	2032
140426	Xã Púng Tra	2032
140425	Xã Phỏng Lập	2032
140424	Xã Phỏng Lái	2032
140423	Xã Pá Lông	2032
140422	Xã Noong Lay	2032
140421	Xã Nậm Lầu	2032
140420	Xã Mường Khiêng	2032
140419	Xã Mường é	2032
140418	Xã Mường Bám	2032
140417	Xã Muội Nọi	2032
140416	Xã Long Hẹ	2032
140415	Xã Liệp Tè	2032
140414	Xã é Tòng	2032
140413	Xã Co Tòng	2032
140412	Xã Co Mạ	2032
140411	Xã Chiềng Sơ	2032
140410	Xã Chiềng Pha	2032
140409	Xã Chiềng Pấc	2032
140408	Xã Chiềng Ngàm	2032
140407	Xã Chiềng Ly	2032
140406	Xã Chiềng La	2032
140405	Xã Chiềng Bôm	2032
140404	Xã Bon Phặng	2032
140403	Xã Bó Mười	2032
140402	Xã Bản Lầm	2032
140401	Thị trấn Thuận Châu	2032
140919	Xã Yên Hưng	2007
140918	Xã Pú Bẩu	2007
140917	Xã Nậm Ty	2007
140916	Xã Nậm Mằn	2007
140915	Nà Nghịu	2007
140914	Xã Mường Sai	2007
140913	Xã Mường Lầm	2007
140912	Xã Mường Hung	2007
140911	Xã Mường Cai	2007
140910	Xã Huổi Một	2007
140909	Xã Đứa Mòn	2007
140908	Xã Chiềng Sơ	2007
140907	Xã Chiềng Phung	2007
140906	Xã Chiềng Khương	2007
140905	Xã Chiềng Khoong	2007
140904	Xã Chiềng En	2007
140903	Xã Chiềng Cang	2007
140902	Xã Bó Sinh	2007
140901	Thị trấn Sông Mã	2007
140627	Xã Tường Tiến	1996
140626	Xã Tường Thượng	1996
140625	Xã Tường Phù	1996
140624	Xã Tường Phong	1996
140623	Xã Tường Hạ	1996
140622	Xã Tân Phong	1996
140621	Xã Tân Lang	1996
140620	Xã Suối Tọ	1996
140619	Xã Suối Bau	1996
140618	Xã Sập Xa	1996
140617	Xã Quang Huy	1996
140616	Xã Nam Phong	1996
140615	Xã Mường Thải	1996
140614	Xã Mường Lang	1996
140613	Xã Mường Do	1996
140612	Xã Mường Cơi	1996
140611	Xã Mường Bang	1996
140610	Xã Kim Bon	1996
140609	Xã Huy Tường	1996
140608	Xã Huy Thượng	1996
140607	Xã Huy Tân	1996
140606	Xã Huy Hạ	1996
140605	Xã Huy Bắc	1996
140604	Xã Gia Phù	1996
140603	Xã Đá Đỏ	1996
140602	Xã Bắc Phong	1996
140601	Thị trấn Phù Yên	1996
91295	Phường Vân Sơn	1976
91294	Xã Chiềng Chung	1976
91293	Xã Đoàn Kết	1976
91292	Xã Tân Yên	1976
91291	Phường Cờ Đỏ	1976
91290	Phường Bình Minh	1976
91289	Phường Thảo Nguyên	1976
91288	Phường Mộc Lỵ	1976
91287	Phường Mộc Sơn	1976
90792	Thị Trấn Nông Trường	1976
141015	Xã Tân Lập	1976
141014	Xã Tân Hợp	1976
141013	Xã Tà Lai	1976
141012	Xã Qui Hướng	1976
141011	Xã Phiêng Luông	1976
141010	Xã Nà Mường	1976
141009	Xã Mường Sang	1976
141008	Xã Lóng Sập	1976
141007	Xã Hua Păng	1976
141006	Xã Đông Sang	1976
141005	Xã Chiềng Sơn	1976
141004	Xã Chiềng Khừa	1976
141003	Xã Chiềng Hắc	1976
141002	Thị trấn NT Mộc Châu	1976
141001	Thị trấn Mộc Châu	1976
140722	Xã Tà Hộc	1971
140721	Xã Phiêng Pằn	1971
140720	Xã Phiêng Cằm	1971
140719	Xã Nà Pó	1971
140718	Xã Nà Ơt	1971
140717	Xã Mương Chanh	1971
140716	Xã Mường Bon	1971
140715	Xã Mường Bằng	1971
140714	Xã Hát Lót	1971
140713	Xã Cò Nòi	1971
140712	Xã Chiềng Ve	1971
140711	Xã Chiềng Sung	1971
140710	Xã Chiềng Nơi	1971
140709	Xã Chiềng Mung	1971
140708	Xã Chiềng Mai	1971
140707	Xã Chiềng Lương	1971
140706	Xã Chiềng Kheo	1971
140705	Xã Chiềng Dong	1971
140704	Xã Chiềng Chung	1971
140703	Xã Chiềng Chăn	1971
140702	Xã Chiềng Ban	1971
140701	Thị trấn Hát Lót	1971
140112	Xã Hua La	1677
140111	Xã Chiềng Xôm	1677
140110	Xã Chiềng Ngần	1677
140109	Xã Chiềng Đen	1677
140108	Xã Chiềng Cọ	1677
140107	Phường Tô Hiệu	1677
140106	Phường Quyết Thắng	1677
140105	Phường Quyết Tâm	1677
140104	Phường Chiềng Sinh	1677
140103	Phường Chiềng Lề	1677
140102	Phường Chiềng Cơi	1677
140101	Phường Chiềng An	1677
621015	Xã Vàng Đán	2179
621014	Xã Si Pa Phìn	2179
621013	Xã Phìn Hồ	2179
621012	Xã Pa Tần	2179
621011	Xã Nậm Tin	2179
621010	Xã Nậm Nhừ	2179
621009	Xã Nậm Khăn	2179
621008	Xã Nậm Chua	2179
621007	Xã Nà Khoa	2179
621006	Xã Nà Hỳ	2179
621005	Xã Na Cô Sa	2179
621004	Xã Nà Bủng	2179
621003	Xã Chà Tở	2179
621002	Xã Chà Nưa	2179
621001	Xã Chà Cang	2179
620910	Xã Xuân Lao	2170
620909	Xã Ngối Cáy	2170
620908	Xã Nặm Lịch	2170
620907	Xã Mường Lạn	2170
620906	Xã Mường Đăng	2170
620905	Xã Búng Lao	2170
620904	Xã Ẳng Tở	2170
620903	Xã Ẳng Nưa	2170
620902	Xã Ẳng Cang	2170
620901	Thị trấn Mường Ảng	2170
620714	Xã Xa Dung	2123
620713	Xã Tìa Dình	2123
620712	Xã Pú Nhi	2123
620711	Xã Pú Hồng	2123
620710	Xã Phình Giàng	2123
620709	Xã Phì Nhừ	2123
620708	Xã Nong U	2123
620707	Xã Na Son	2123
620706	Xã Mường Luân	2123
620705	Xã Luân Giới	2123
620704	Xã Keo Lôm	2123
620703	Xã Háng Lìa	2123
620702	Xã Chiềng Sơ	2123
620701	Thị trấn Điện Biên Đông	2123
620203	Xã Lay Nưa	2060
620202	Phường Sông Đà	2060
620201	Phường Na Lay	2060
620419	Xã Tỏa Tình	2022
620418	Xã Tênh Phông	2022
620417	Xã Ta Ma	2022
620416	Xã Rạng Đông	2022
620415	Xã Quài Tở	2022
620414	Xã Quài Nưa	2022
620413	Xã Quài Cang	2022
620412	Xã Pú Xi	2022
620411	Xã Pú Nhung	2022
620410	Xã Phình Sáng	2022
620409	Xã Nà Tòng	2022
620408	Xã Nà Sáy	2022
620407	Xã Mường Thín	2022
620406	Xã Mường Mùn	2022
620405	Xã Mường Khong	2022
620404	Xã Mùn Chung	2022
620403	Xã Chiềng Sinh	2022
620402	Xã Chiềng Đông	2022
620401	Thị trấn Tuần Giáo	2022
90840	Xã Xá Nhè	2021
620612	Xã Xín Chải	2021
620611	Xã Tủa Thàng	2021
620610	Xã Trung Thu	2021
620609	Xã Tả Sìn Thàng	2021
620608	Xã Tả Phìn	2021
620607	Xã Sính Phình	2021
620606	Xã Sáng Nhè	2021
620605	Xã Mường Đun	2021
620604	Xã Mường Báng	2021
620603	Xã Lao Xả Phình	2021
620602	Xã Huổi Só	2021
620601	Thị trấn Tủa Chùa	2021
620811	Xã Sín Thầu	1979
620810	Xã Sen Thượng	1979
620809	Xã Quảng Lâm	1979
620808	Xã Pá Mỳ	1979
620807	Xã Nậm Vì	1979
620806	Xã Nậm Kè	1979
620805	Xã Mường Toong	1979
620804	Xã Mường Nhé	1979
620803	Xã Leng Su Sìn	1979
620802	Xã Huổi Lếnh	1979
620801	Xã Chung Chải	1979
620512	Xã Xá Tổng	1978
620511	Xã Sa Lông	1978
620510	Xã Pa Ham	1978
620509	Xã Nậm Nèn	1978
620508	Xã Na Sang	1978
620507	Xã Mường Tùng	1978
620506	Xã Mường Mươn	1978
620505	Xã Ma Thì Hồ	1978
620504	Xã Huổi Mí	1978
620503	Xã Huổi Lèng	1978
620502	Xã Hừa Ngài	1978
620501	Thị Trấn Mường Chà	1978
620325	Xã Thanh Yên	1923
620324	Xã Thanh Xương	1923
620323	Xã Thanh Nưa	1923
620322	Xã Thanh Luông	1923
620321	Xã Thanh Hưng	1923
620320	Xã Thanh Chăn	1923
620319	Xã Thanh An	1923
620318	Xã Sam Mứn	1923
620317	Xã Pom Lót	1923
620316	Xã Phu Luông	1923
620315	Xã Pa Thơm	1923
620314	Xã Pá Khoang	1923
620313	Xã Núa Ngam	1923
620312	Xã Noong Luống	1923
620311	Xã Noọng Hẹt	1923
620310	Xã Na Ư	1923
620309	Xã Na Tông	1923
620308	Xã Nà Tấu	1923
620307	Xã Nà Nhạn	1923
620306	Xã Mường Pồn	1923
620305	Xã Mường Phăng	1923
620304	Xã Mường Nhà	1923
620303	Xã Mường Lói	1923
620302	Xã Hua Thanh	1923
620301	Xã Hẹ Muông	1923
800205	Xã Pá Khoang	1676
800204	Xã Nà Tấu	1676
800203	Xã Nà Nhạn	1676
800202	Xã Mường Phăng	1676
620109	Xã Thanh Minh	1676
620108	Xã Tà Lèng	1676
620107	Phường Thanh Trường	1676
620106	Phường Thanh Bình	1676
620105	Phường Tân Thanh	1676
620104	Phường Noong Bua	1676
620103	Phường Nam Thanh	1676
620102	Phường Mường Thanh	1676
620101	Phường Him Lam	1676
70612	Xã Tà Mung	2025
70611	Xã Tà Hừa	2025
70610	Xã Tà Gia	2025
70609	Xã Phúc Than	2025
70608	Xã Pha Mu	2025
70607	Xã Mường Than	2025
70606	Xã Mường Mít	2025
70605	Xã Mường Kim	2025
70604	Xã Mường Cang	2025
70603	Xã Khoen On	2025
70602	Xã Hua Nà	2025
70601	Thị trấn Than Uyên	2025
70710	Xã Trung Đồng	2017
70709	Xã Thân Thuộc	2017
70708	Xã Tà Mít	2017
70707	Xã Phúc Khoa	2017
70706	Xã Pắc Ta	2017
70705	Xã Nậm Sỏ	2017
70704	Xã Nậm Cần	2017
70703	Xã Mường Khoa	2017
70702	Xã Hố Mít	2017
70701	Thị trấn Tân Uyên	2017
70214	Xã Thèn Sin	2010
70213	Xã Tả Lèng	2010
70212	Xã Sùng Phài	2010
70211	Xã Sơn Bình	2010
70210	Xã Nùng Nàng	2010
70209	Xã Nà Tăm	2010
70208	Xã Khun Há	2010
70207	Xã Hồ Thầu	2010
70206	Xã Giang Ma	2010
70205	Xã Bình Lư	2010
70204	Xã Bản Hon	2010
70203	Xã Bản Giang	2010
70202	Xã Bản Bo	2010
70201	Thị trấn Tam Đường	2010
70422	Xã Tủa Sín Chải	2006
70421	Xã Tả Phìn	2006
70420	Xã Tả Ngảo	2006
70419	Xã Sà Dề Phìn	2006
70418	Xã Pu Sam Cáp	2006
70417	Xã Phìn Hồ	2006
70416	Xã Phăng Sô Lin	2006
70415	Xã Pa Tần	2006
70414	Xã Pa Khoá	2006
70413	Xã Noong Hẻo	2006
70412	Xã Nậm Tăm	2006
70411	Xã Nậm Mạ	2006
70410	Xã Nậm Hăn	2006
70409	Xã Nậm Cuổi	2006
70408	Xã Nậm Cha	2006
70407	Xã Ma Quai	2006
70406	Xã Lùng Thàng	2006
70405	Xã Làng Mô	2006
70404	Xã Hồng Thu	2006
70403	Xã Chăn Nưa	2006
70402	Xã Căn Co	2006
70401	Thị trấn Sìn Hồ	2006
800252	Xã Sì Lở Lầu	1989
70318	Xã Vàng Ma Chải	1989
70317	Xã Tông Qua Lìn	1989
70316	Xã Sin Suối Hồ	1989
70315	Xã Sì Lờ Lầu	1989
70314	Xã Pa Vây Sử	1989
70313	Xã Nậm Xe	1989
70312	Xã Mường So	1989
70311	Xã Mù Sang	1989
70310	Xã Mồ Sì San	1989
70309	Xã Ma Ly Pho	1989
70308	Xã Ma Li Chải	1989
70307	Xã Lả Nhì Thàng	1989
70306	Xã Khổng Lào	1989
70305	Xã Huổi Luông	1989
70304	Xã Hoang Thèn	1989
70303	Xã Dào San	1989
70302	Xã Bản Lang	1989
70301	Thị trấn Phong Thổ	1989
70811	Xã Trung Chải	1984
70810	Xã Pú Đao	1984
70809	Xã Nậm Pì	1984
70808	Xã Nậm Manh	1984
70807	Xã Nậm Hàng	1984
70806	Xã Nậm Chà	1984
70805	Xã Nậm Ban	1984
70804	Xã Mường Mô	1984
70803	Xã Lê Lợi	1984
70802	Xã Hua Bum	1984
70801	Thị trấn Nậm Nhùn	1984
70514	Xã Vàng San	1980
70513	Xã Thu Lũm	1980
70512	Xã Tà Tổng	1980
70511	Xã Tá Bạ	1980
70510	Xã Pa Vệ Sử	1980
70509	Xã Pa ủ	1980
70508	Xã Nậm Khao	1980
70507	Xã Mường Tè	1980
70506	Xã Mù Cả	1980
70505	Xã Kan Hồ	1980
70504	Xã Ka Lăng	1980
70503	Xã Bum Tở	1980
70502	Xã Bum Nưa	1980
70501	Thị trấn Mường Tè	1980
800251	Xã Sùng Phài	1675
70107	Xã San Thàng	1675
70106	Xã Nậm Loỏng	1675
70105	Phường Tân Phong	1675
70104	Phường Quyết Tiến	1675
70103	Phường Quyết Thắng	1675
70102	Phường Đông Phong	1675
70101	Phường Đoàn Kết	1675
130426	Xã Yên Thành	2266
130425	Xã Yên Bình	2266
130424	Xã Xuân Long	2266
130423	Xã Xuân Lai	2266
130422	Xã Vũ Linh	2266
130421	Xã Vĩnh Kiên	2266
130420	Xã Văn Lãng	2266
130419	Xã Tích Cốc	2266
130418	Xã Thịnh Hưng	2266
130417	Xã Tân Nguyên	2266
130416	Xã Tân Hương	2266
130415	Xã Phúc Ninh	2266
130414	Xã Phúc An	2266
130413	Xã Phú Thịnh	2266
130412	Xã Ngọc Chấn	2266
130411	Xã Mỹ Gia	2266
130410	Xã Mông Sơn	2266
130409	Xã Hán Đà	2266
130408	Xã Đại Minh	2266
130407	Xã Đại Đồng	2266
130406	Xã Cảm Nhân	2266
130405	Xã Cảm Ân	2266
130404	Xã Bảo Ái	2266
130403	Xã Bạch Hà	2266
130402	Thị trấn Yên Bình	2266
130401	Thị trấn Thác Bà	2266
130812	Xã Xà Hồ	2248
130811	Xã Túc Đán	2248
130810	Xã Trạm Tấu	2248
130809	Xã Tà Si Láng	2248
130808	Xã Phình Hồ	2248
130807	Xã Pá Lau	2248
130806	Xã Pá Hu	2248
130805	Xã Làng Nhì	2248
130804	Xã Hát Lìu	2248
130803	Xã Bản Mù	2248
130802	Xã Bản Công	2248
130801	Thị trấn Trạm Tấu	2248
800259	Xã Thạch Lương	2063
800258	Xã Phúc Sơn	2063
800257	Xã Hạnh Sơn	2063
800256	Xã Thanh Lương	2063
800255	Xã Phù Nham	2063
800254	Xã Sơn A	2063
800253	Xã Nghĩa Lộ	2063
130207	Xã Nghĩa Phúc	2063
130206	Xã Nghĩa Lợi	2063
130205	Xã Nghĩa An	2063
130204	Phường Trung Tâm	2063
130203	Phường Tân An	2063
130202	Phường Pú Trạng	2063
130201	Phường Cầu Thia	2063
130327	Xã Yên Thái	2047
130326	Xã Yên Phú	2047
130325	Xã Yên Hưng	2047
130324	Xã Yên Hợp	2047
130323	Xã Xuân Tầm	2047
130322	Xã Xuân Ái	2047
130321	Xã Viễn Sơn	2047
130320	Xã Tân Hợp	2047
130319	Xã Quang Minh	2047
130318	Xã Phong Dụ Thượng	2047
130317	Xã Phong Dụ Hạ	2047
130316	Xã Ngòi A	2047
130315	Xã Nà Hẩu	2047
130314	Xã Mỏ Vàng	2047
130313	Xã Mậu Đông	2047
130312	Xã Lang Thíp	2047
130311	Xã Lâm Giang	2047
130310	Xã Hoàng Thắng	2047
130309	Xã Đông Cuông	2047
130308	Xã Đông An	2047
130307	Xã Đại Sơn	2047
130306	Xã Đại Phác	2047
130305	Xã Châu Quế Thượng	2047
130304	Xã Châu Quế Hạ	2047
130303	Xã An Thịnh	2047
130302	Xã An Bình	2047
130301	Thị trấn Mậu A	2047
130631	Xã Tú Lệ	2044
130630	Xã Thượng Bằng La	2044
130629	Xã Thanh Lương	2044
130628	Xã Thạch Lương	2044
130627	Xã Tân Thịnh	2044
130626	Xã Suối Quyền	2044
130625	Xã Suối Giàng	2044
130624	Xã Suối Bu	2044
130623	Xã Sùng Đô	2044
130622	Xã Sơn Thịnh	2044
130621	Xã Sơn Lương	2044
130620	Xã Sơn A	2044
130619	Xã Phúc Sơn	2044
130618	Xã Phù Nham	2044
130617	Xã Nghĩa Tâm	2044
130616	Xã Nghĩa Sơn	2044
130615	Xã Nậm Mười	2044
130614	Xã Nậm Lành	2044
130613	Xã Nậm Búng	2044
130612	Xã Minh An	2044
130611	Xã Hạnh Sơn	2044
130610	Xã Gia Hội	2044
130609	Xã Đồng Khê	2044
130608	Xã Đại Lịch	2044
130607	Xã Chấn Thịnh	2044
130606	Xã Cát Thịnh	2044
130605	Xã Bình Thuận	2044
130604	Xã An Lương	2044
130603	Thị trấn NT Trần Phú	2044
130602	Thị trấn NT Nghĩa Lộ	2044
130601	Thị trấn NT Liên Sơn	2044
91297	Xã Thành Thịnh	2039
130722	Xã Y Can	2039
130721	Xã Việt Thành	2039
130720	Xã Việt Hồng	2039
130719	Xã Việt Cường	2039
130718	Xã Vân Hội	2039
130717	Xã Tân Đồng	2039
130716	Xã Quy Mông	2039
130715	Xã Nga Quán	2039
130714	Xã Minh Tiến	2039
130713	Xã Minh Quân	2039
130712	Xã Minh Quán	2039
130711	Xã Lương Thịnh	2039
130710	Xã Kiên Thành	2039
130709	Xã Hưng Thịnh	2039
130708	Xã Hưng Khánh	2039
130707	Xã Hồng Ca	2039
130706	Xã Hòa Cuông	2039
130705	Xã Đào Thịnh	2039
130704	Xã Cường Thịnh	2039
130703	Xã Bảo Hưng	2039
130702	Xã Báo Đáp	2039
130701	Thị trấn Cổ Phúc	2039
90734	Dế Xu Phình	1977
130514	Xã Púng Luông	1977
130513	Xã Nậm Khắt	1977
130512	Xã Nậm Có	1977
130511	Xã Mồ Dề	1977
130510	Xã Lao Chải	1977
130509	Xã La Pán Tẩn	1977
130508	Xã Kim Nọi	1977
130507	Xã Khao Mang	1977
130506	Xã Hồ Bốn	1977
130505	Xã Dế Su Phình	1977
130504	Xã Chế Tạo	1977
130503	Xã Chế Cu Nha	1977
130502	Xã Cao Phạ	1977
130501	Thị trấn Mù Căng Chải	1977
130924	Xã Yên Thắng	1967
130923	Xã Vĩnh Lạc	1967
130922	Xã Trung Tâm	1967
130921	Xã Trúc Lâu	1967
130920	Xã Tô Mậu	1967
130919	Xã Tân Phượng	1967
130918	Xã Tân Lĩnh	1967
130917	Xã Tân Lập	1967
130916	Xã Phúc Lợi	1967
130915	Xã Phan Thanh	1967
130914	Xã Mường Lai	1967
130913	Xã Minh Xuân	1967
130912	Xã Minh Tiến	1967
130911	Xã Minh Chuẩn	1967
130910	Xã Mai Sơn	1967
130909	Xã Liễu Đô	1967
130908	Xã Lâm Thượng	1967
130907	Xã Khánh Thiện	1967
130906	Xã Khánh Hoà	1967
130905	Xã Khai Trung	1967
130904	Xã Động Quan	1967
130903	Xã An Phú	1967
130902	Xã An Lạc	1967
130901	Thị trấn Yên Thế	1967
130117	Xã Văn Tiến	1674
130116	Xã Văn Phú	1674
130115	Xã Tuy Lộc	1674
130114	Xã Tân Thịnh	1674
130113	Xã Phúc Lộc	1674
130112	Xã Minh Bảo	1674
130111	Xã Giới Phiên	1674
130110	Xã Âu Lâu	1674
130109	Phường Yên Thịnh	1674
130108	Phường Yên Ninh	1674
130107	Phường Nguyễn Thái Học	1674
130106	Phường Nguyễn Phúc	1674
130105	Phường Nam Cường	1674
130104	Phường Minh Tân	1674
130103	Phường Hợp Minh	1674
130102	Phường Hồng Hà	1674
130101	Phường Đồng Tâm	1674
370907	Xã Canh Vinh	3312
370906	Xã Canh Thuận	3312
370905	Xã Canh Liên	3312
370904	Xã Canh Hòa	3312
370903	Xã Canh Hiệp	3312
370902	Xã Canh Hiển	3312
370901	Thị trấn Vân Canh	3312
370815	Xã Vĩnh An	3279
370814	Xã Tây Xuân	3279
370813	Xã Tây Vinh	3279
370812	Xã Tây Thuận	3279
370811	Xã Tây Phú	3279
370810	Xã Tây Giang	3279
370809	Xã Tây Bình	3279
370808	Xã Tây An	3279
370807	Xã Bình Tường	3279
370806	Xã Bình Thuận	3279
370805	Xã Bình Thành	3279
370804	Xã Bình Tân	3279
370803	Xã Bình Nghi	3279
370802	Xã Bình Hòa	3279
370801	Thị trấn Phú Phong	3279
370519	Xã Mỹ Trinh	3254
370518	Xã Mỹ Thọ	3254
370517	Xã Mỹ Thành	3254
370516	Xã Mỹ Thắng	3254
370515	Xã Mỹ Tài	3254
370514	Xã Mỹ Quang	3254
370513	Xã Mỹ Phong	3254
370512	Xã Mỹ Lợi	3254
370511	Xã Mỹ Lộc	3254
370510	Xã Mỹ Hòa	3254
370509	Xã Mỹ Hiệp	3254
370508	Xã Mỹ Đức	3254
370507	Xã Mỹ Châu	3254
370506	Xã Mỹ Chánh Tây	3254
370505	Xã Mỹ Chánh	3254
370504	Xã Mỹ Cát	3254
370503	Xã Mỹ An	3254
370502	Thị trấn Phù Mỹ	3254
370501	Thị trấn Bình Dương	3254
370709	Xã Vĩnh Thuận	2258
370708	Xã Vĩnh Thịnh	2258
370707	Xã Vĩnh Sơn	2258
370706	Xã Vĩnh Quang	2258
370705	Xã Vĩnh Kim	2258
370704	Xã Vĩnh Hòa	2258
370703	Xã Vĩnh Hiệp	2258
370702	Xã Vĩnh Hảo	2258
370701	Thị trấn Vĩnh Thạnh	2258
370315	Xã Dak Mang	2140
370314	Xã Bok Tới	2140
370313	Xã Ân Tường Tây	2140
370312	Xã Ân Tường Đông	2140
370311	Xã Ân Tín	2140
370310	Xã Ân Thạnh	2140
370309	Xã Ân Sơn	2140
370308	Xã Ân Phong	2140
370307	Xã Ân Nghĩa	2140
370306	Xã Ân Mỹ	2140
370305	Xã Ân Hữu	2140
370304	Xã Ân Hảo Tây	2140
370303	Xã Ân Hảo Đông	2140
370302	Xã Ân Đức	2140
370301	Thị trấn Tăng Bạt Hổ	2140
371113	Xã Phước Thuận	2023
371112	Xã Phước Thành	2023
371111	Xã Phước Thắng	2023
371110	Xã Phước Sơn	2023
371109	Xã Phước Quang	2023
371108	Xã Phước Nghĩa	2023
371107	Xã Phước Lộc	2023
371106	Xã Phước Hưng	2023
371105	Xã Phước Hòa	2023
371104	Xã Phước Hiệp	2023
371103	Xã Phước An	2023
371102	Thị trấn Tuy Phước	2023
371101	Thị trấn Diêu Trì	2023
370210	Xã An Vinh	1886
370209	Xã An Trung	1886
370208	Xã An Toàn	1886
370207	Xã An Tân	1886
370206	Xã An Quang	1886
370205	Xã An Nghĩa	1886
370204	Xã An Hưng	1886
370203	Xã An Hòa	1886
370202	Xã An Dũng	1886
370201	Thị trấn An Lão	1886
370417	Phường Tam Quan Nam	1771
370416	Phường Tam Quan Bắc	1771
370415	Phường Hoài Xuân	1771
370414	Phường Hoài Thanh Tây	1771
370413	Phường Hoài Thanh	1771
370412	Phường Hoài Tân	1771
370411	Xã Hoài Sơn	1771
370410	Xã Hoài Phú	1771
370409	Xã Hoài Mỹ	1771
370408	Phường Hoài Hương	1771
370407	Phường Hoài Hảo	1771
370406	Xã Hoài Hải	1771
370405	Phường Hoài Đức	1771
370404	Xã Hoài Châu Bắc	1771
370403	Xã Hoài Châu	1771
370402	Thị trấn Bồng Sơn	1771
370401	Thị trấn  Tam Quan	1771
370618	Xã Cát Tường	1770
370617	Xã Cát Trinh	1770
370616	Xã Cát Tiến	1770
370615	Xã Cát Thành	1770
370614	Xã Cát Thắng	1770
370613	Xã Cát Tân	1770
370612	Xã Cát Tài	1770
370611	Xã Cát Sơn	1770
370610	Xã Cát Nhơn	1770
370609	Xã Cát Minh	1770
370608	Xã Cát Lâm	1770
370607	Xã Cát Khánh	1770
370606	Xã Cát Hưng	1770
370605	Xã Cát Hiệp	1770
370604	Xã Cát Hanh	1770
370603	Xã Cát Hải	1770
370602	Xã Cát Chánh	1770
370601	Thị trấn Ngô Mây	1770
371015	Xã Nhơn Thọ	1769
371014	Xã Nhơn Tân	1769
371013	Xã Nhơn Phúc	1769
371012	Xã Nhơn Phong	1769
371011	Xã Nhơn Mỹ	1769
371010	Xã Nhơn Lộc	1769
371009	Xã Nhơn Khánh	1769
371008	Xã Nhơn Hậu	1769
371007	Xã Nhơn Hạnh	1769
371006	Xã Nhơn An	1769
371005	Phường Nhơn Thành	1769
371004	Phường Nhơn Hưng	1769
371003	Phường Nhơn Hoà	1769
371002	Phường Đập Đá	1769
371001	Phường Bình Định	1769
370121	Xã Phước Mỹ	1662
370120	Xã Nhơn Lý	1662
370119	Xã Nhơn Hội	1662
370118	Xã Nhơn Hải	1662
370117	Xã Nhơn Châu	1662
370116	Phường Trần Quang Diệu	1662
370115	Phường Trần Phú	1662
370114	Phường Trần Hưng Đạo	1662
370113	Phường Thị Nại	1662
370112	Phường Quang Trung	1662
370111	Phường Nhơn Phú	1662
370110	Phường Nhơn Bình	1662
370109	Phường Nguyễn Văn Cừ	1662
370108	Phường Ngô Mây	1662
370107	Phường Lý Thường Kiệt	1662
370106	Phường Lê Lợi	1662
370105	Phường Lê Hồng Phong	1662
370104	Phường Hải Cảng	1662
370103	Phường Ghềnh Ráng	1662
370102	Phường Đống Đa	1662
370101	Phường Bùi Thị Xuân	1662
450708	Xã Phước Ninh	3302
450707	Xã Phước Nam	3302
450706	Xã Phước Minh	3302
450705	Xã Phước Hà	3302
450704	Xã Phước Dinh	3302
450703	Xã Phước Diêm	3302
450702	Xã Nhị Hà	3302
450701	Xã Cà Ná	3302
450606	Xã Phước Kháng	3301
450605	Xã Phước Chiến	3301
450604	Xã Lợi Hải	3301
450603	Xã Công Hải	3301
450602	Xã Bắc Sơn	3301
450601	Xã Bắc Phong	3301
450509	Xã Phước Trung	3129
450508	Xã Phước Tiến	3129
450507	Xã Phước Thành	3129
450506	Xã Phước Thắng	3129
450505	Xã Phước Tân	3129
450504	Xã Phước Hòa	3129
450503	Xã Phước Đại	3129
450502	Xã Phước Chính	3129
450501	Xã Phước Bình	3129
450409	Xã Phước Vinh	1986
450408	Xã Phước Thuận	1986
450407	Xã Phước Thái	1986
450406	Xã Phước Sơn	1986
450405	Xã Phước Hữu	1986
450404	Xã Phước Hậu	1986
450403	Xã Phước Hải	1986
450402	Xã An Hải	1986
450401	Thị trấn Phước Dân	1986
450309	Xã Xuân Hải	1985
450308	Xã Vĩnh Hải	1985
450307	Xã Tri Hải	1985
450306	Xã Thanh Hải	1985
450305	Xã Tân Hải	1985
450304	Xã Phương Hải	1985
450303	Xã Nhơn Hải	1985
450302	Xã Hộ Hải	1985
450301	Thị trấn Khánh Hải	1985
450208	Xã Quảng Sơn	1855
450207	Xã Nhơn Sơn	1855
450206	Xã Mỹ Sơn	1855
450205	Xã Ma Nới	1855
450204	Xã Lương Sơn	1855
450203	Xã Lâm Sơn	1855
450202	Xã Hòa Sơn	1855
450201	Thị trấn Tân Sơn	1855
450116	Xã Thành Hải	1665
450115	Phường Văn Hải	1665
450114	Phường Thanh Sơn	1665
450113	Phường Tấn Tài	1665
450112	Phường Phước Mỹ	1665
450111	Phường Phủ Hà	1665
450110	Phường Mỹ Hương	1665
450109	Phường Mỹ Hải	1665
450108	Phường Mỹ Đông	1665
450107	Phường Mỹ Bình	1665
450106	Phường Kinh Dinh	1665
450105	Phường Đông Hải	1665
450104	Phường Đô Vinh	1665
450103	Phường Đạo Long	1665
450102	Phường Đài Sơn	1665
450101	Phường Bảo An	1665
800109	Xã An Hòa Hải	3284
390416	Xã An Xuân	3284
390415	Xã An Thọ	3284
390414	Xã An Thạch	3284
390413	Xã An Ninh Tây	3284
390412	Xã An Ninh Đông	3284
390411	Xã An Nghiệp	3284
390410	Xã An Mỹ	3284
390409	Xã An Lĩnh	3284
390408	Xã An Hòa	3284
390407	Xã An Hiệp	3284
390406	Xã An Hải	3284
390405	Xã An Định	3284
390404	Xã An Dân	3284
390403	Xã An Cư	3284
390402	Xã An Chấn	3284
390401	Thị trấn Chí Thạnh	3284
90780	Thị trấn Tây Hòa	3278
390911	Xã Sơn Thành Tây	3278
390910	Xã Sơn Thành Đông	3278
390909	Xã Hòa Thịnh	3278
390908	Xã Hòa Tân Tây	3278
390907	Xã Hòa Phú	3278
390906	Xã Hòa Phong	3278
390905	Xã Hòa Mỹ Tây	3278
390904	Xã Hòa Mỹ Đông	3278
390903	Xã Hòa Đồng	3278
390902	Xã Hòa Bình 1	3278
390901	Thị trấn Phú Thứ	3278
390211	Xã Xuân Sơn Nam	3186
390210	Xã Xuân Sơn Bắc	3186
390209	Xã Xuân Quang 3	3186
390208	Xã Xuân Quang 2	3186
390207	Xã Xuân Quang 1	3186
390206	Xã Xuân Phước	3186
390205	Xã Xuân Long	3186
390204	Xã Xuân Lãnh	3186
390203	Xã Phú Mỡ	3186
390202	Xã Đa Lộc	3186
390201	Thị trấn La Hai	3186
390710	Xã Hòa Xuân Tây	3184
390709	Xã Hòa Xuân Nam	3184
390708	Xã Hòa Xuân Đông	3184
390707	Xã Hòa Thành	3184
390706	Xã Hòa Tân Đông	3184
390705	Xã Hòa Tâm	3184
390704	Xã Hòa Hiệp Nam	3184
390703	Phường Hòa Hiệp Bắc	3184
390702	Phường Hòa Vinh	3184
390701	Thị trấn Hoà Hiệp Trung	3184
390514	Xã Suối Trai	2211
390513	Xã Suối Bạc	2211
390512	Xã Sơn Xuân	2211
390511	Xã Sơn Phước	2211
390510	Xã Sơn Nguyên	2211
390509	Xã Sơn Long	2211
390508	Xã Sơn Hội	2211
390507	Xã Sơn Hà	2211
390506	Xã Sơn Định	2211
390505	Xã Phước Tân	2211
390504	Xã Krông Pa	2211
390503	Xã Eachà Rang	2211
390502	Xã Cà Lúi	2211
390501	Thị trấn Củng Sơn	2211
390611	Xã Sông Hinh	2206
390610	Xã Sơn Giang	2206
390609	Xã EaTrol	2206
390608	Xã Ealy	2206
390607	Xã EaBia	2206
390606	Xã EaBar	2206
390605	Xã Ea Lâm	2206
390604	Xã Ea Bá	2206
390603	Xã Đức Bình Tây	2206
390602	Xã Đức Bình Đông	2206
390601	Thị trấn Hai Riêng	2206
390809	Xã Hòa Trị	1993
390808	Xã Hòa Thắng	1993
390807	Xã Hòa Quang Nam	1993
390806	Xã Hòa Quang Bắc	1993
390805	Xã Hòa Hội	1993
390804	Xã Hòa Định Tây	1993
390803	Xã Hòa Định Đông	1993
390802	Xã Hòa An	1993
390801	Thị Trấn Phú Hoà	1993
390314	Xã Xuân Thọ 2	1856
390313	Xã Xuân Thọ 1	1856
390312	Xã Xuân Thịnh	1856
390311	Xã Xuân Phương	1856
390310	Xã Xuân Lộc	1856
390309	Xã Xuân Lâm	1856
390308	Xã Xuân Hòa	1856
390307	Xã Xuân Hải	1856
390306	Xã Xuân Cảnh	1856
390305	Xã Xuân Bình	1856
390304	Phường Xuân Yên	1856
390303	Phường Xuân Thành	1856
390302	Phường Xuân Phú	1856
390301	Phường Xuân Đài	1856
390116	Xã Hòa Kiến	1663
390115	Xã Bình Ngọc	1663
390114	Xã Bình Kiến	1663
390113	Xã An Phú	1663
390112	Phường Phú Thạnh	1663
390111	Phường Phú Lâm	1663
390110	Phường Phú Đông	1663
390109	Phường 9	1663
390108	Phường 8	1663
390107	Phường 7	1663
390106	Phường 6	1663
390105	Phường 5	1663
390104	Phường 4	1663
390103	Phường 3	1663
390102	Phường 2	1663
390101	Phường 1	1663
361003	Xã Ia Tơi	3446
361002	Xã Ia Dom	3446
361001	Xã Ia Đal	3446
360911	Xã Văn Xuôi	2225
360910	Xã Tu Mơ Rông	2225
360909	Xã Tê Xăng	2225
360908	Xã Ngọc Yêu	2225
360907	Xã Ngọc Lây	2225
360906	Xã Măng Ri	2225
360905	Xã Đắk Tơ Kan	2225
360904	Xã Đắk Sao	2225
360903	Xã Đắk Rơ Ông	2225
360902	Xã Đắk Na	2225
360901	Xã Đắk Hà	2225
360511	Xã Ya Xiêr	2205
360510	Xã Ya Tăng	2205
360509	Xã Ya ly	2205
360508	Xã Sa Sơn	2205
360507	Xã Sa Nhơn	2205
360506	Xã Sa Nghĩa	2205
360505	Xã Sa Bình	2205
360504	Xã Rơ Kơi	2205
360503	Xã Mô Rai	2205
360502	Xã Hơ Moong	2205
360501	Thị trấn Sa Thầy	2205
360308	Xã Sa Loong	2187
360307	Xã Bờ Y	2187
360306	Xã Đắk Xú	2187
360305	Xã Đắk Nông	2187
360304	Xã Đắk Kan	2187
360303	Xã Đắk Dục	2187
360302	Xã Đắk Ang	2187
360301	Thị trấn Plei Kần	2187
360807	Xã Tân Lập	2148
360806	Xã Đắk Tờ Re	2148
360805	Xã Đắk Tơ Lung	2148
360804	Xã Đắk Ruồng	2148
360803	Xã Đắk Pne	2148
360802	Xã Đắk Kôi	2148
360801	Thị trấn Đắk Rve	2148
360409	Xã Văn Lem	2121
360408	Xã Tân Cảnh	2121
360407	Xã Pô Kô	2121
360406	Xã Ngọk Tụ	2121
360405	Xã Kon Đào	2121
360404	Xã Diên Bình	2121
360403	Xã Đắk Trăm	2121
360402	Xã Đắk Rơ Nga	2121
360401	Thị trấn Đắk Tô	2121
360212	Xã Xốp	1921
360211	Xã Ngọc Linh	1921
360210	Xã Mường Hoong	1921
360209	Xã Đắk Blô	1921
360208	Xã Đắk Pék	1921
360207	Xã Đắk Nhoong	1921
360206	Xã Đắk Môn	1921
360205	Xã Đắk Man	1921
360204	Xã Đắk Long	1921
360203	Xã Đắk KRoong	1921
360202	Xã Đắk Choong	1921
360201	Thị trấn Đắk Glei	1921
360711	Xã Ngok Wang	1835
360710	Xã Ngok Réo	1835
360709	Xã Hà Mòn	1835
360708	Xã Đắk Ui	1835
360707	Xã Đắk PXi	1835
360706	Xã Đăk Ngọk	1835
360705	Xã Đắk Mar	1835
360704	Xã Đăk Long	1835
360703	Xã Đắk La	1835
360702	Xã Đắk HRing	1835
360701	Thị trấn Đắk Hà	1835
800069	Thị Trấn Măng Đen	1834
360609	Xã Pờ Ê	1834
360608	Xã Ngok Tem	1834
360607	Xã Măng Cành	1834
360606	Xã Măng Buk	1834
360605	Xã Hiếu	1834
360604	Xã Đắk Tăng	1834
360603	Xã Đắk Ring	1834
360602	Xã Đắk Nên	1834
360601	Xã Đắk Long	1834
360121	Xã Vinh Quang	1660
360120	Xã Ngọk Bay	1660
360119	Xã Kroong	1660
360118	Xã Ia Chim	1660
360117	Xã Hòa Bình	1660
360116	Xã Đoàn Kết	1660
360115	Xã Đắk Rơ Wa	1660
360114	Xã Đăk Năng	1660
360113	Xã Đắk Cấm	1660
360112	Xã Đắk Blà	1660
360111	Xã Chư Hreng	1660
360110	Phường Trường Chinh	1660
360109	Phường Trần Hưng Đạo	1660
360108	Phường Thống Nhất	1660
360107	Phường Thắng Lợi	1660
360106	Phường Quyết Thắng	1660
360105	Phường Quang Trung	1660
360104	Phường Nguyễn Trãi	1660
360103	Phường Ngô Mây	1660
360102	Phường Lê Lợi	1660
360101	Phường Duy Tân	1660
470610	Xã Thắng Hải	3196
470609	Xã Tân Xuân	3196
470608	Xã Tân Thắng	3196
470607	Xã Tân Phúc	3196
470606	Xã Tân Hà	3196
470605	Xã Tân Đức	3196
470604	Xã Sông Phan	3196
470603	Xã Sơn Mỹ	3196
470602	Thị trấn Tân Nghĩa	3196
470601	Thị trấn Tân Minh	3196
470903	Xã Tam Thanh	2116
470902	Xã Ngũ Phụng	2116
470901	Xã Long Hải	2116
470814	Xã Suối Kiết	2012
470813	Xã Nghị Đức	2012
470812	Xã Măng Tố	2012
470811	Xã La Ngâu	2012
470810	Xã Huy Khiêm	2012
470809	Xã Gia Huynh	2012
470808	Xã Gia An	2012
470807	Xã Đức Thuận	2012
470806	Xã Đức Tân	2012
470805	Xã Đức Phú	2012
470804	Xã Đức Bình	2012
470803	Xã Đồng Kho	2012
470802	Xã Bắc Ruộng	2012
470801	Thị trấn Lạc Tánh	2012
470212	Xã Vĩnh Tân	1781
470211	Xã Vĩnh Hảo	1781
470210	Xã Phước Thể	1781
470209	Xã Phú Lạc	1781
470208	Xã Phong Phú	1781
470207	Xã Phan Dũng	1781
470206	Xã Hòa Phú	1781
470205	Xã Hòa Minh	1781
470204	Xã Chí Công	1781
470203	Xã Bình Thạnh	1781
470202	Thị trấn Phan Rí Cửa	1781
470201	Thị trấn Liên Hương	1781
470318	Xã Sông Lũy	1780
470317	Xã Sông Bình	1780
470316	Xã Phan Tiến	1780
470315	Xã Phan Thanh	1780
470314	Xã Phan Sơn	1780
470313	Xã Phan Rí Thành	1780
470312	Xã Phan Lâm	1780
470311	Xã Phan Hòa	1780
470310	Xã Phan Hiệp	1780
470309	Xã Phan Điền	1780
470308	Xã Hồng Thái	1780
470307	Xã Hồng Phong	1780
470306	Xã Hòa Thắng	1780
470305	Xã Hải Ninh	1780
470304	Xã Bình Tân	1780
470303	Xã Bình An	1780
470302	Thị trấn Lương Sơn	1780
470301	Thị trấn Chợ Lầu	1780
470713	Xã Vũ Hoà	1779
470712	Xã Trà Tân	1779
470711	Xã Tân Hà	1779
470710	Xã Sùng Nhơn	1779
470709	Xã Nam Chính	1779
470708	Xã Mê Pu	1779
470707	Xã Đức Tín	1779
470706	Xã Đức Hạnh	1779
470705	Xã Đức Chính	1779
470704	Xã Đông Hà	1779
470703	Xã Đa Kai	1779
470702	Thị trấn Võ Xu	1779
470701	Thị trấn Đức Tài	1779
471009	Xã Tân Tiến	1778
471008	Xã Tân Phước	1778
471007	Xã Tân Hải	1778
471006	Xã Tân Bình	1778
471005	Phường Tân Thiện	1778
471004	Phường Tân An	1778
471003	Phường Phước Lộc	1778
471002	Phường Phước Hội	1778
471001	Phường Bình Tân	1778
470417	Xã Thuận Minh	1777
470416	Xã Thuận Hòa	1777
470415	Xã La Dạ	1777
470414	Xã Hồng Sơn	1777
470413	Xã Hồng Liêm	1777
470412	Xã Hàm Trí	1777
470411	Xã Hàm Thắng	1777
470410	Xã Hàm Phú	1777
470409	Xã Hàm Liêm	1777
470408	Xã Hàm Hiệp	1777
470407	Xã Hàm Đức	1777
470406	Xã Hàm Chính	1777
470405	Xã Đông Tiến	1777
470404	Xã Đông Giang	1777
470403	Xã Đa Mi	1777
470402	Thị trấn Phú Long	1777
470401	Thị trấn Ma Lâm	1777
470513	Xã Thuận Quí	1776
470512	Xã Tân Thuận	1776
470511	Xã Tân Thành	1776
470510	Xã Tân Lập	1776
470509	Xã Mỹ Thạnh	1776
470508	Xã Mương Mán	1776
470507	Xã Hàm Thạnh	1776
470506	Xã Hàm Mỹ	1776
470505	Xã Hàm Minh	1776
470504	Xã Hàm Kiệm	1776
470503	Xã Hàm Cường	1776
470502	Xã Hàm Cần	1776
470501	Thị trấn Thuận Nam	1776
470118	Xã Tiến Thành	1666
470117	Xã Tiến Lợi	1666
470116	Xã Thiện Nghiệp	1666
470115	Xã Phong Nẫm	1666
470114	Phường Xuân An	1666
470113	Phường Thanh Hải	1666
470112	Phường Phú Trinh	1666
470111	Phường Phú Thủy	1666
470110	Phường Phú Tài	1666
470109	Phường Phú Hài	1666
470108	Phường Mũi Né	1666
470107	Phường Lạc Đạo	1666
470106	Phường Hưng Long	1666
470105	Phường Hàm Tiến	1666
470104	Phường Đức Thắng	1666
470103	Phường Đức Nghĩa	1666
470102	Phường Đức Long	1666
470101	Phường Bình Hưng	1666
600208	Xã Vĩnh Hưng A	2050
600207	Xã Vĩnh Hưng	2050
600206	Xã Long Thạnh	2050
600205	Xã Hưng Thành	2050
600204	Xã Hưng Hội	2050
600203	Xã Châu Thới	2050
600202	Xã Châu Hưng A	2050
600201	Thị trấn Châu Hưng	2050
600508	Xã Vĩnh Thanh	1998
600507	Xã Vĩnh Phú Tây	1998
600506	Xã Vĩnh Phú Đông	1998
600505	Xã Phước Long	1998
600504	Xã Phong Thạnh Tây B	1998
600503	Xã Phong Thạnh Tây A	1998
600502	Xã Hưng Phú	1998
600501	Thị trấn Phước Long	1998
600309	Xã Vĩnh Lộc A	1946
600308	Xã Vĩnh Lộc	1946
600307	Xã Ninh Thạnh Lợi A	1946
600306	Xã Ninh Thạnh Lợi	1946
600305	Xã Ninh Quới A	1946
600304	Xã Ninh Quới	1946
600303	Xã Ninh Hòa	1946
600302	Xã Lộc Ninh	1946
600301	Thị trấn Ngan Dừa	1946
600410	Xã Tân Thạnh	1935
600409	Xã Tân Phong	1935
600408	Xã Phong Thạnh Tây	1935
600407	Xã Phong Thạnh Đông	1935
600406	Xã Phong Thạnh A	1935
600405	Xã Phong Thạnh	1935
600404	Xã Phong Tân	1935
600403	Phường Láng Tròn	1935
600402	Phường Hộ Phòng	1935
600401	Phường 1	1935
600611	Xã Long Điền Tây	1926
600610	Xã Long Điền Đông A	1926
600609	Xã Long Điền Đông	1926
600608	Xã Long Điền	1926
600607	Xã Định Thành A	1926
600606	Xã Định Thành	1926
600605	Xã Điền Hải	1926
600604	Xã An Trạch A	1926
600603	Xã An Trạch	1926
600602	Xã An Phúc	1926
600601	Thị trấn Gành Hào	1926
600708	Xã Vĩnh Thịnh	1723
600707	Xã Vĩnh Mỹ B	1723
600706	Xã Vĩnh Mỹ A	1723
600705	Xã Vĩnh Hậu A	1723
600704	Xã Vĩnh Hậu	1723
600703	Xã Vĩnh Bình	1723
600702	Xã Minh Diệu	1723
600701	Thị trấn Hòa Bình	1723
600110	Xã Vĩnh Trạch Đông	1655
600109	Xã Vĩnh Trạch	1655
600108	Xã Hiệp Thành	1655
600107	Phường Nhà Mát	1655
600106	Phường 8	1655
600105	Phường 7	1655
600104	Phường 5	1655
600103	Phường 3	1655
600102	Phường 2	1655
600101	Phường 1	1655
610707	Xã Viên An Đông	2186
610706	Xã Viên An	2186
610705	Xã Tân Ân Tây	2186
610704	Xã Tân Ân	2186
610703	Xã Tam Giang Tây	2186
610702	Xã Đất Mũi	2186
610701	Thị trấn Rạch Gốc	2186
610308	Xã Nguyễn Phích	2042
610307	Xã Khánh Tiến	2042
610306	Xã Khánh Thuận	2042
610305	Xã Khánh Lâm	2042
610304	Xã Khánh Hội	2042
610303	Xã Khánh Hòa	2042
610302	Xã Khánh An	2042
610301	Thị trấn U Minh	2042
610413	Xã Trần Hợi	2038
610412	Xã Phong Lạc	2038
610411	Xã Phong Điền	2038
610410	Xã Lợi An	2038
610409	Xã Khánh Lộc	2038
610408	Xã Khánh Hưng	2038
610407	Xã Khánh Hải	2038
610406	Xã Khánh Bình Tây Bắc	2038
610405	Xã Khánh Bình Tây	2038
610404	Xã Khánh Bình Đông	2038
610403	Xã Khánh Bình	2038
610402	Thị trấn Trần Văn Thời	2038
610401	Thị trấn Sông Đốc	2038
610616	Xã Trần Phán	1922
610615	Xã Thanh Tùng	1922
610614	Xã Tân Trung	1922
610613	Xã Tân Tiến	1922
610612	Xã Tân Thuận	1922
610611	Xã Tân Duyệt	1922
610610	Xã Tân Đức	1922
610609	Xã Tân Dân	1922
610608	Xã Tạ An Khương  Nam	1922
610607	Xã Tạ An Khương Đông	1922
610606	Xã Tạ An Khương	1922
610605	Xã Quách Phẩm Bắc	1922
610604	Xã Quách Phẩm	1922
610603	Xã Nguyễn Huân	1922
610602	Xã Ngọc Chánh	1922
610601	Thị trấn Đầm Dơi	1922
610511	Xã Trần Thới	1901
610510	Xã Thạnh Phú	1901
610509	Xã Tân Hưng Đông	1901
610508	Xã Tân Hưng	1901
610507	Xã Phú Hưng	1901
610506	Xã Lương Thế Trân	1901
610505	Xã Hưng Mỹ	1901
610504	Xã Hoà Mỹ	1901
610503	Xã Đông Thới	1901
610502	Xã Đông Hưng	1901
610501	Thị trấn Cái Nước	1901
800005	Xã Nguyễn Việt Khái	1883
61099	Xã Việt Thắng	1883
61098	Xã Việt Khái	1883
61097	Xã Tân Hưng Tây	1883
61096	Xã Tân Hải	1883
61095	Xã Rạch Chèo	1883
61094	Xã Phú Thuận	1883
61093	Xã Phú Tân	1883
61092	Xã Phú Mỹ	1883
61091	Thị trấn Cái Đôi Vàm	1883
610808	Xã Tam Giang Đông	1783
610807	Xã Tam Giang	1783
610806	Xã Lâm Hải	1783
610805	Xã Hiệp Tùng	1783
610804	Xã Hàng Vịnh	1783
610803	Xã Hàm Rồng	1783
610802	Xã Đất Mới	1783
610801	Thị Trấn Năm Căn	1783
610212	Xã Trí Phải	1782
610211	Xã Trí Lực	1782
610210	Xã Thới Bình	1782
610209	Xã Tân Phú	1782
610208	Xã Tân Lộc Đông	1782
610207	Xã Tân Lộc Bắc	1782
610206	Xã Tân Lộc	1782
610205	Xã Tân Bằng	1782
610204	Xã Hồ Thị Kỷ	1782
610203	Xã Biển Bạch Đông	1782
610202	Xã Biển Bạch	1782
610201	Thị trấn Thới Bình	1782
610117	Xã Tân Thành	1654
610116	Xã Tắc Vân	1654
610115	Xã Lý Văn Lâm	1654
610114	Xã Hòa Thành	1654
610113	Xã Hòa Tân	1654
610112	Xã Định Bình	1654
610111	Xã An Xuyên	1654
610110	Phường Tân Xuyên	1654
610109	Phường Tân Thành	1654
610108	Phường 9	1654
610107	Phường 8	1654
610106	Phường 7	1654
610105	Phường 6	1654
610104	Phường 5	1654
610103	Phường 4	1654
610102	Phường 2	1654
610101	Phường 1	1654
640308	Xã Xà Phiên	3445
640307	Xã Vĩnh Viễn A	3445
640306	Xã Vĩnh Viễn	3445
640305	Xã Vĩnh Thuận Đông	3445
640304	Xã Thuận Hưng	3445
640303	Xã Thuận Hòa	3445
640302	Xã Lương Tâm	3445
640301	Xã Lương Nghĩa	3445
640809	Xã Tân Phú	3218
640808	Xã Long Trị A	3218
640807	Xã Long Trị	3218
640806	Xã Long Phú	3218
640805	Xã Long Bình	3218
640804	Phường Vĩnh Tường	3218
640803	Phường Trà Lồng	3218
640802	Phường Thuận An	3218
640801	Phường Bình Thạnh	3218
64059	Xã Phú Tân	2096
64058	Xã Phú Hữu	2096
64057	Xã Phú An	2096
64056	Xã Đông Thạnh	2096
64055	Xã Đông Phước A	2096
64054	Xã Đông Phước	2096
64053	Xã Đông Phú	2096
64052	Thị Trấn Ngã Sáu	2096
64051	Thị trấn Mái Dầm	2096
640210	Xã Vĩnh Tường	2048
640209	Xã Vĩnh Trung	2048
640208	Xã Vĩnh Thuận Tây	2048
640207	Xã Vị Trung	2048
640206	Xã Vị Thuỷ	2048
640205	Xã Vị Thanh	2048
640204	Xã Vị Thắng	2048
640203	Xã Vị Đông	2048
640202	Xã Vị Bình	2048
640201	Thị trấn Nàng Mau	2048
640610	Xã Trường Long Tây	1912
640609	Xã Trường Long A	1912
640608	Xã Thạnh Xuân	1912
640607	Xã Tân Phú Thạnh	1912
640606	Xã Tân Hoà	1912
640605	Xã Nhơn Nghĩa A	1912
640604	Thị trấn Rạch Gòi	1912
640603	Thị trấn Một Ngàn	1912
640602	Thị trấn Cái Tắc	1912
640601	Thị trấn Bảy Ngàn	1912
640415	Xã Thạnh Hòa	1824
640414	Xã Tân Phước Hưng	1824
640413	Xã Tân Long	1824
640412	Xã Tân Bình	1824
640411	Xã Phương Phú	1824
640410	Xã Phương Bình	1824
640409	Xã Phụng Hiệp	1824
640408	Xã Long Thạnh	1824
640407	Xã Hòa Mỹ	1824
640406	Xã Hòa An	1824
640405	Xã Hiệp Hưng	1824
640404	Xã Bình Thành	1824
640403	Thị trấn Kinh Cùng	1824
640402	Thị trấn Cây Dương	1824
640401	Thị trấn Búng Tàu	1824
640706	Xã Tân Thành	1823
640705	Xã Hiệp Lợi	1823
640704	Xã Đại Thành	1823
640703	Phường Ngã Bảy	1823
640702	Phường Lái Hiếu	1823
640701	Phường Hiệp Thành	1823
640109	Xã Vị Tân	1653
640108	Xã Tân Tiến	1653
640107	Xã Hoả Tiến	1653
640106	Xã Hoả Lựu	1653
640105	Phường VII	1653
640104	Phường V	1653
640103	Phường IV	1653
640102	Phường III	1653
640101	Phường I	1653
91347	Xã Quang Minh	1969
91346	Xã An Tập	1969
190814	Xã Trừng Xá	1969
190813	Xã Trung Kênh	1969
190812	Xã Trung Chính	1969
190811	Xã Tân Lãng	1969
190810	Xã Quảng Phú	1969
190809	Xã Phú Lương	1969
190808	Xã Phú Hòa	1969
190807	Xã Mỹ Hương	1969
190806	Xã Minh Tân	1969
190805	Xã Lâm Thao	1969
190804	Xã Lai Hạ	1969
190803	Xã Bình Định	1969
190802	Xã An Thịnh	1969
190801	Thị trấn Thứa	1969
190214	Xã Yên Trung	1768
190213	Xã Yên Phụ	1768
190212	Xã Văn Môn	1768
190211	Xã Trung Nghĩa	1768
190210	Xã Thụy Hòa	1768
190209	Xã Tam Giang	1768
190208	Xã Tam Đa	1768
190207	Xã Long Châu	1768
190206	Xã Hòa Tiến	1768
190205	Xã Dũng Liệt	1768
190204	Xã Đông Tiến	1768
190203	Xã Đông Thọ	1768
190202	Xã Đông Phong	1768
190201	Thị trấn Chờ	1768
190618	Xã Xuân Lâm	1767
190617	Xã Trí Quả	1767
190616	Xã Trạm Lộ	1767
190615	Xã Thanh Khương	1767
190614	Xã Song Liễu	1767
190613	Xã Song Hồ	1767
190612	Xã Ninh Xá	1767
190611	Xã Nguyệt Đức	1767
190610	Xã Ngũ Thái	1767
190609	Xã Nghĩa Đạo	1767
190608	Xã Mão Điền	1767
190607	Xã Hoài Thượng	1767
190606	Xã Hà Mãn	1767
190605	Xã Gia Đông	1767
190604	Xã Đình Tổ	1767
190603	Xã Đại Đồng Thành	1767
190602	Xã An Bình	1767
190601	Thị trấn Hồ	1767
190714	Xã Xuân Lai	1766
190713	Xã Vạn Ninh	1766
190712	Xã Thái Bảo	1766
190711	Xã Song Giang	1766
190710	Xã Quỳnh Phú	1766
190709	Xã Nhân Thắng	1766
190708	Xã Lãng Ngâm	1766
190707	Xã Giang Sơn	1766
190706	Xã Đông Cứu	1766
190705	Xã Đại Lai	1766
190704	Xã Đại Bái	1766
190703	Xã Cao Đức	1766
190702	Xã Bình Dương	1766
190701	Thị trấn Gia Bình	1766
190512	Xã Tương Giang	1730
190511	Xã Tam Sơn	1730
190510	Xã Phù Khê	1730
190509	Xã Phù Chẩn	1730
190508	Xã Hương Mạc	1730
190507	Phường Trang Hạ	1730
190506	Phường Tân Hồng	1730
190505	Phường Đồng Nguyên	1730
190504	Phường Đông Ngàn	1730
190503	Phường Đồng Kỵ	1730
190502	Phường Đình Bảng	1730
190501	Phường Châu Khê	1730
190414	Xã Việt Đoàn	1729
190413	Xã Tri Phương	1729
190412	Xã Tân Chi	1729
190411	Xã Phú Lâm	1729
190410	Xã Phật Tích	1729
190409	Xã Nội Duệ	1729
190408	Xã Minh Đạo	1729
190407	Xã Liên Bão	1729
190406	Xã Lạc Vệ	1729
190405	Xã Hoàn Sơn	1729
190404	Xã Hiên Vân	1729
190403	Xã Đại Đồng	1729
190402	Xã Cảnh Hưng	1729
190401	Thị trấn Lim	1729
90794	Phường Vân Dương	1728
190321	Xã Yên Giả	1728
190320	Xã Việt Thống	1728
190319	Xã Việt Hùng	1728
190318	Xã Quế Tân	1728
190317	Xã Phượng Mao	1728
190316	Xã Phương Liễu	1728
190315	Xã Phù Lương	1728
190314	Xã Phù Lãng	1728
190313	Xã Nhân Hòa	1728
190312	Xã Ngọc Xá	1728
190311	Xã Mộ Đạo	1728
190310	Xã Hán Quảng	1728
190309	Xã Đức Long	1728
190308	Xã Đào Viên	1728
190307	Xã Đại Xuân	1728
190306	Xã Chi Lăng	1728
190305	Xã Châu Phong	1728
190304	Xã Cách Bi	1728
190303	Xã Bồng Lai	1728
190302	Xã Bằng An	1728
190301	Thị trấn Phố Mới	1728
91345	Phường Tiền Ninh Vệ	1644
190119	Phường Nam Sơn	1644
190118	Xã Kim Chân	1644
190117	Xã Hòa Long	1644
190116	Phường Vũ Ninh	1644
190115	Phường Võ Cường	1644
190114	Phường Vệ An	1644
190113	Phường Vân Dương	1644
190112	Phường Vạn An	1644
190111	Phường Tiền An	1644
190110	Phường Thị Cầu	1644
190109	Phường Suối Hoa	1644
190108	Phường Phong Khê	1644
190107	Phường Ninh Xá	1644
190106	Phường Kinh Bắc	1644
190105	Phường Khúc Xuyên	1644
190104	Phường Khắc Niệm	1644
190103	Phường Hạp Lĩnh	1644
190102	Phường Đáp Cầu	1644
190101	Phường Đại Phúc	1644
91334	Phường Phượng Sơn	3701
91333	Xã Nam Dương	3701
91332	Xã Mỹ An	3701
91331	Phường Trù Hựu	3701
91330	Xã Quý Sơn	3701
91329	Phường Hồng Giang	3701
91328	Xã Kiên Thành	3701
91327	Xã Kiên Lao	3701
91326	Phường Thanh Hải	3701
91325	Phường Chũ	3701
91320	Xã Sa Lý	1966
180330	Xã Xa Lý	1966
180329	Xã Trù Hựu	1966
180328	Xã Thanh Hải	1966
180327	Xã Tân Sơn	1966
180326	Xã Tân Quang	1966
180325	Xã Tân Mộc	1966
180324	Xã Tân Lập	1966
180323	Xã Tân Hoa	1966
180322	Xã Sơn Hải	1966
180321	Xã Quý Sơn	1966
180320	Xã Phượng Sơn	1966
180319	Xã Phú Nhuận	1966
180318	Xã Phong Vân	1966
180317	Xã Phong Minh	1966
180316	Xã Phì Điền	1966
180315	Xã Nghĩa Hồ	1966
180314	Xã Nam Dương	1966
180313	Xã Mỹ An	1966
180312	Xã Kim Sơn	1966
180311	Xã Kiên Thành	1966
180310	Xã Kiên Lao	1966
180309	Xã Hồng Giang	1966
180308	Xã Hộ Đáp	1966
180307	Xã Giáp Sơn	1966
180306	Xã Đồng Cốc	1966
180305	Xã Đèo Gia	1966
180304	Xã Cấm Sơn	1966
180303	Xã Biên Sơn	1966
180302	Xã Biển Động	1966
180301	Thị trấn Chũ	1966
180527	Xã Yên Sơn	1965
180526	Xã Vũ Xá	1965
180525	Xã Vô Tranh	1965
180524	Xã Trường Sơn	1965
180523	Xã Trường Giang	1965
180522	Xã Tiên Nha	1965
180521	Xã Tiên Hưng	1965
180520	Xã Thanh Lâm	1965
180519	Xã Tam Dị	1965
180518	Xã Phương Sơn	1965
180517	Xã Nghĩa Phương	1965
180516	Xã Lục Sơn	1965
180515	Xã Lan Mẫu	1965
180514	Xã Khám Lạng	1965
180513	Xã Huyền Sơn	1965
180512	Xã Đông Phú	1965
180511	Xã Đông Hưng	1965
180510	Xã Đan Hội	1965
180509	Xã Cương Sơn	1965
180508	Xã Chu Điện	1965
180507	Xã Cẩm Lý	1965
180506	Xã Bình Sơn	1965
180505	Xã Bảo Sơn	1965
180504	Xã Bảo Đài	1965
180503	Xã Bắc Lũng	1965
180502	Thị trấn Lục Nam	1965
180501	Thị trấn Đồi Ngô	1965
180221	Xã Xuân Lương	1765
180220	Xã Tiến Thắng	1765
180219	Xã Tân Sỏi	1765
180218	Xã Tân Hiệp	1765
180217	Xã Tam Tiến	1765
180216	Xã Tam Hiệp	1765
180215	Thị trấn Phồn Xương	1765
180214	Xã Hương Vĩ	1765
180213	Xã Hồng Kỳ	1765
180212	Xã Đồng Vương	1765
180211	Xã Đồng Tiến	1765
180210	Xã Đồng Tâm	1765
180209	Xã Đông Sơn	1765
180208	Xã Đồng Lạc	1765
180207	Xã Đồng Kỳ	1765
180206	Xã Đồng Hưu	1765
180205	Xã Canh Nậu	1765
180204	Xã Bố Hạ	1765
180203	Xã An Thượng	1765
180202	Thị trấn Cầu Gồ	1765
180201	Thị trấn Bố Hạ	1765
800004	Thị Trấn Nham Biền	1764
181021	Xã Yên Lư	1764
181020	Xã Xuân Phú	1764
181019	Xã Tư Mại	1764
181018	Xã Trí Yên	1764
181017	Xã Tiền Phong	1764
181016	Xã Tiến Dũng	1764
181015	Xã Thắng Cương	1764
181014	Xã Tân Liễu	1764
181013	Thị trấn Tân An	1764
181012	Xã Quỳnh Sơn	1764
181011	Xã Nội Hoàng	1764
181010	Xã Nham Sơn	1764
181009	Xã Lão Hộ	1764
181008	Xã Lãng Sơn	1764
181007	Xã Hương Gián	1764
181006	Xã Đức Giang	1764
181005	Xã Đồng Việt	1764
181004	Xã Đồng Phúc	1764
181003	Xã Cảnh Thụy	1764
181002	Thị trấn Tân Dân	1764
181001	Thị trấn Neo	1764
180919	Xã Việt Tiến	1763
180918	Xã Vân Trung	1763
180917	Xã Vân Hà	1763
180916	Xã Tự Lạn	1763
180915	Xã Trung Sơn	1763
180914	Xã Tiên Sơn	1763
180913	Xã Thượng Lan	1763
180912	Xã Tăng Tiến	1763
180911	Xã Quảng Minh	1763
180910	Xã Quang Châu	1763
180909	Xã Ninh Sơn	1763
180908	Xã Nghĩa Trung	1763
180907	Xã Minh Đức	1763
180906	Xã Hương Mai	1763
180905	Xã Hồng Thái	1763
180904	Xã Hoàng Ninh	1763
180903	Xã Bích Sơn	1763
180902	Thị trấn Nếnh	1763
180901	Thị trấn Bích Động	1763
91319	Xã Lam Sơn	1762
91318	Xã Quang Trung	1762
180624	Xã Việt Ngọc	1762
180623	Xã Việt Lập	1762
180622	Xã Tân Trung	1762
180621	Xã Song Vân	1762
180620	Xã Quế Nham	1762
180619	Xã Quang Tiến	1762
180618	Xã Phúc Sơn	1762
180617	Xã Phúc Hòa	1762
180616	Xã Nhã Nam	1762
180615	Xã Ngọc Vân	1762
180614	Xã Ngọc Thiện	1762
180613	Xã Ngọc Lý	1762
180612	Xã Ngọc Châu	1762
180611	Xã Liên Sơn	1762
180610	Xã Liên Chung	1762
180609	Xã Lan Giới	1762
180608	Xã Lam Cốt	1762
180607	Xã Hợp Đức	1762
180606	Xã Đại Hóa	1762
180605	Xã Cao Xá	1762
180604	Xã Cao Thượng	1762
180603	Xã An Dương	1762
180602	Thị trấn Nhã Nam	1762
180601	Thị trấn Cao Thượng	1762
800003	Xã Đại Sơn	1761
800002	Xã Vĩnh An	1761
800001	Thị Trấn Tây Yên Tử	1761
800000	Xã Phúc Sơn	1761
180423	Xã Yên Định	1761
180422	Xã Vĩnh Khương	1761
180421	Xã Vân Sơn	1761
180420	Xã Tuấn Mậu	1761
180419	Xã Tuấn Đạo	1761
180418	Xã Thanh Luận	1761
180417	Xã Thạch Sơn	1761
180416	Xã Quế Sơn	1761
180415	Xã Phúc Thắng	1761
180414	Xã Long Sơn	1761
180413	Xã Lệ Viễn	1761
180412	Xã Hữu Sản	1761
180411	Xã Giáo Liêm	1761
180410	Xã Dương Hưu	1761
180409	Xã Chiên Sơn	1761
180408	Xã Cẩm Đàn	1761
180407	Xã Bồng Am	1761
180406	Xã An Lập	1761
180405	Xã An Lạc	1761
180404	Xã An Châu	1761
180403	Xã An Bá	1761
180402	Thị trấn Thanh Sơn	1761
180401	Thị trấn An Châu	1761
180823	Xã Yên Mỹ	1760
180822	Xã Xương Lâm	1760
180821	Xã Xuân Hương	1760
180820	Xã Tiên Lục	1760
180819	Xã Thái Đào	1760
180818	Xã Tân Thịnh	1760
180817	Xã Tân Thanh	1760
180816	Xã Tân Hưng	1760
180815	Xã Tân Dĩnh	1760
180814	Xã Quang Thịnh	1760
180813	Xã Phi Mô	1760
180812	Xã Nghĩa Hưng	1760
180811	Xã Nghĩa Hòa	1760
180810	Xã Mỹ Thái	1760
180809	Xã Mỹ Hà	1760
180808	Xã Hương Sơn	1760
180807	Xã Hương Lạc	1760
180806	Xã Dương Đức	1760
180805	Xã Đào Mỹ	1760
180804	Xã Đại Lâm	1760
180803	Xã An Hà	1760
180802	Thị trấn Vôi	1760
180801	Thị trấn Kép	1760
91324	Xã Hùng Thái	1759
91323	Xã Sơn Thịnh	1759
91322	Xã Toàn Thắng	1759
91321	Xã Đồng Tiến	1759
180726	Xã Xuân Cẩm	1759
180725	Xã Thường Thắng	1759
180724	Xã Thanh Vân	1759
180723	Xã Thái Sơn	1759
180722	Xã Quang Minh	1759
180721	Xã Ngọc Sơn	1759
180720	Xã Mai Trung	1759
180719	Xã Mai Đình	1759
180718	Xã Lương Phong	1759
180717	Xã Hương Lâm	1759
180716	Xã Hùng Sơn	1759
180715	Xã Hợp Thịnh	1759
180714	Xã Hoàng Vân	1759
180713	Xã Hoàng Thanh	1759
180712	Xã Hoàng Lương	1759
180711	Xã Hoàng An	1759
180710	Xã Hòa Sơn	1759
180709	Xã Đức Thắng	1759
180708	Xã Đồng Tân	1759
180707	Xã Đông Lỗ	1759
180706	Xã Đoan Bái	1759
180705	Xã Danh Thắng	1759
180704	Xã Đại Thành	1759
180703	Xã Châu Minh	1759
180702	Xã Bắc Lý	1759
180701	Thị trấn Thắng	1759
91628	Xã Thắng Cương	1643
91627	Xã Nham Sơn	1643
91317	Xã Đồng Phúc	1643
91316	Xã Đồng Việt	1643
91315	Xã Tư Mại	1643
91314	Phường Cảnh Thụy	1643
91313	Xã Đức Giang	1643
91312	Xã Tiến Dũng	1643
91311	Xã Yên Lư	1643
91310	Xã Lãng Sơn	1643
91309	Xã Trí Yên	1643
91308	Phường Tân Liễu	1643
91307	Xã Xuân Phú	1643
91306	Phường Tiền Phong	1643
91305	Phường Nội Hoàng	1643
91304	Xã Quỳnh Sơn	1643
91303	Phường Hương Gián	1643
91302	Phường Tân An	1643
91301	Phường Nham Biền	1643
180116	Xã Tân Tiến	1643
180115	Xã Tân Mỹ	1643
180114	Xã Song Mai	1643
180113	Xã Song Khê	1643
180112	Xã Đồng Sơn	1643
180111	Xã Dĩnh Trì	1643
180110	Phường Xương Giang	1643
180109	Phường Trần Phú	1643
180108	Phường Trần Nguyên Hãn	1643
180107	Phường Thọ Xương	1643
180106	Phường Ngô Quyền	1643
180105	Phường Mỹ Độ	1643
180104	Phường Lê Lợi	1643
180103	Phường Hoàng Văn Thụ	1643
180102	Phường Dĩnh Kế	1643
180101	Phường Đa Mai	1643
800082	Xã Điềm He	3311
800081	Xã Liên Hội	3311
800080	Xã An Sơn	3311
100624	Xã Yên Phúc	3311
100623	Xã Xuân Mai	3311
100622	Xã Vĩnh Lại	3311
100621	Xã Việt Yên	3311
100620	Xã Vân Mộng	3311
100619	Xã Văn An	3311
100618	Xã Tú Xuyên	3311
100617	Xã Tri Lễ	3311
100616	Xã Tràng Sơn	3311
100615	Xã Tràng Phái	3311
100614	Xã Tràng Các	3311
100613	Xã Trấn Ninh	3311
100612	Xã Tân Đoàn	3311
100611	Xã Song Giang	3311
100610	Xã Phú Mỹ	3311
100609	Xã Lương Năng	3311
100608	Xã Khánh Khê	3311
100607	Xã Hữu Lễ	3311
100606	Xã Hòa Bình	3311
100605	Xã Đồng Giáp	3311
100604	Xã Đại An	3311
100603	Xã Chu Túc	3311
100602	Xã Bình Phúc	3311
100601	Thị trấn Văn Quan	3311
800079	Xã Bắc Việt	3310
800078	Xã Bắc Hùng	3310
100420	Xã Trùng Quán	3310
100419	Xã Trùng Khánh	3310
100418	Xã Thụy Hùng	3310
100417	Xã Thanh Long	3310
100416	Xã Thành Hòa	3310
100415	Xã Tân Việt	3310
100414	Xã Tân Thanh	3310
100413	Xã Tân Tác	3310
100412	Xã Tân Mỹ	3310
100411	Xã Tân Lang	3310
100410	Xã Nhạc Kỳ	3310
100409	Xã Nam La	3310
100408	Xã Hồng Thái	3310
100407	Xã Hội Hoan	3310
100406	Xã Hoàng Việt	3310
100405	Xã Gia Miễn	3310
100404	Xã Bắc La	3310
100403	Xã An Hùng	3310
100402	Xã  Hoàng Văn Thụ	3310
100401	Thị trấn Na Sầm	3310
101012	Xã Thái Bình	3182
101011	Xã Lâm Ca	3182
101010	Xã Kiên Mộc	3182
101009	Xã Đồng Thắng	3182
101008	Xã Đình Lập	3182
101007	Xã Cường Lợi	3182
101006	Xã Châu Sơn	3182
101005	Xã Bính Xá	3182
101004	Xã Bắc Xa	3182
101003	Xã Bắc Lãng	3182
101002	Thị trấn NT Thái Bình	3182
101001	Thị trấn Đình Lập	3182
100921	Xã Y Tịch	3156
100920	Xã Vân Thủy	3156
100919	Xã Vạn Linh	3156
100918	Xã Vân An	3156
100917	Xã Thượng Cường	3156
100916	Xã Quang Lang	3156
100915	Xã Quan Sơn	3156
100914	Xã Nhân Lý	3156
100913	Xã Mai Sao	3156
100912	Xã Liên Sơn	3156
100911	Xã Lâm Sơn	3156
100910	Xã Hữu Kiên	3156
100909	Xã Hòa Bình	3156
100908	Xã Gia Lộc	3156
100907	Xã Chiến Thắng	3156
100906	Xã Chi Lăng	3156
100905	Xã Bằng Mạc	3156
100904	Xã Bằng Hữu	3156
100903	Xã Bắc Thủy	3156
100902	Thị trấn Đồng Mỏ	3156
100901	Thị trấn Chi Lăng	3156
100320	Xã Yên Lỗ	3138
100319	Xã Vĩnh Yên	3138
100318	Xã Tô Hiệu	3138
100317	Xã Thiện Thuật	3138
100316	Xã Thiện Long	3138
100315	Xã Thiện Hòa	3138
100314	Xã Tân Văn	3138
100313	Xã Tân Hòa	3138
100312	Xã Quý Hòa	3138
100311	Xã Quang Trung	3138
100310	Xã Mông Ân	3138
100309	Xã Minh Khai	3138
100308	Xã Hưng Đạo	3138
100307	Xã Hồng Thái	3138
100306	Xã Hồng Phong	3138
100305	Xã Hoàng Văn Thụ	3138
100304	Xã Hoa Thám	3138
100303	Xã Hòa Bình	3138
100302	Xã Bình La	3138
100301	Thị trấn Bình Gia	3138
800073	Xã Bắc Quỳnh	3134
100520	Xã Vũ Sơn	3134
100519	Xã Vũ Lễ	3134
100518	Xã Vũ Lăng	3134
100517	Xã Vạn Thủy	3134
100516	Xã Trấn Yên	3134
100515	Xã Tân Tri	3134
100514	Xã Tân Thành	3134
100513	Xã Tân Lập	3134
100512	Xã Tân Hương	3134
100511	Xã Quỳnh Sơn	3134
100510	Xã Nhất Tiến	3134
100509	Xã Nhất Hòa	3134
100508	Xã Long Đống	3134
100507	Xã Hữu Vĩnh	3134
100506	Xã Hưng Vũ	3134
100505	Xã Đồng ý	3134
100504	Xã Chiêu Vũ	3134
100503	Xã Chiến Thắng	3134
100502	Xã Bắc Sơn	3134
100501	Thị trấn Bắc Sơn	3134
100223	Xã Vĩnh Tiến	2036
100222	Xã Trung Thành	2036
100221	Xã Tri Phương	2036
100220	Xã Tân Yên	2036
100219	Xã Tân Tiến	2036
100218	Xã Tân Minh	2036
100217	Xã Quốc Việt	2036
100216	Xã Quốc Khánh	2036
100215	Xã Kim Đồng	2036
100214	Xã Khánh Long	2036
100213	Xã Kháng Chiến	2036
100212	Xã Hùng Việt	2036
100211	Xã Hùng Sơn	2036
100210	Xã Đội Cấn	2036
100209	Xã Đoàn Kết	2036
100208	Xã Đề Thám	2036
100207	Xã Đào Viên	2036
100206	Xã Đại Đồng	2036
100205	Xã Chí Minh	2036
100204	Xã Chi Lăng	2036
100203	Xã Cao Minh	2036
100202	Xã Bắc Ái	2036
100201	Thị trấn Thất Khê	2036
800077	Xã Thống Nhất	1963
800076	Xã Minh Hiệp	1963
800075	Xã Khánh Xuân	1963
100829	Xã Yên Khoái	1963
100828	Xã Xuân Tình	1963
100827	Xã Xuân Mãn	1963
100826	Xã Xuân Lễ	1963
100825	Xã Xuân Dương	1963
100824	Xã Vân Mộng	1963
100823	Xã Tú Mịch	1963
100822	Xã Tú Đoạn	1963
100821	Xã Tĩnh Bắc	1963
100820	Xã Tam Gia	1963
100819	Xã Sàn Viên	1963
100818	Xã Quan Bản	1963
100817	Xã Nhượng Bạn	1963
100816	Xã Như Khuê	1963
100815	Xã Nam Quan	1963
100814	Xã Minh Phát	1963
100813	Xã Mẫu Sơn	1963
100812	Xã Lục Thôn	1963
100811	Xã Lợi Bác	1963
100810	Xã Khuất Xá	1963
100809	Xã Hữu Lân	1963
100808	Xã Hữu Khánh	1963
100807	Xã Hiệp Hạ	1963
100806	Thị trấn Đông Quan	1963
100805	Xã Đồng Bục	1963
100804	Xã Bằng Khánh	1963
100803	Xã Ái Quốc	1963
100802	Thị trấn Na Dương	1963
100801	Thị trấn Lộc Bình	1963
800074	Xã Thiện Tân	1948
101126	Xã Yên Vượng	1948
101125	Xã Yên Thịnh	1948
101124	Xã Yên Sơn	1948
101123	Xã Yên Bình	1948
101122	Xã Vân Nham	1948
101121	Xã Thiện Kỵ	1948
101120	Xã Thanh Sơn	1948
101119	Xã Tân Thành	1948
101118	Xã Tân Lập	1948
101117	Xã Sơn Hà	1948
101116	Xã Quyết Thắng	1948
101115	Xã Nhật Tiến	1948
101114	Xã Minh Tiến	1948
101113	Xã Minh Sơn	1948
101112	Xã Minh Hòa	1948
101111	Xã Hữu Liên	1948
101110	Xã Hòa Thắng	1948
101109	Xã Hòa Sơn	1948
101108	Xã Hòa Lạc	1948
101107	Xã Hòa Bình	1948
101106	Xã Hồ Sơn	1948
101105	Xã Đồng Tiến	1948
101104	Xã Đồng Tân	1948
101103	Xã Đô Lương	1948
101102	Xã Cai Kinh	1948
101101	Thị trấn Hữu Lũng	1948
100723	Xã Yên Trạch	1904
100722	Xã Xuất Lễ	1904
100721	Xã Xuân Long	1904
100720	Xã Thụy Hùng	1904
100719	Xã Thanh Lòa	1904
100718	Xã Thạch Đạn	1904
100717	Xã Tân Thành	1904
100716	Xã Tân Liên	1904
100715	Xã Song Giáp	1904
100714	Xã Phú Xá	1904
100713	Xã Mẫu Sơn	1904
100712	Xã Lộc Yên	1904
100711	Xã Hợp Thành	1904
100710	Xã Hồng Phong	1904
100709	Xã Hòa Cư	1904
100708	Xã Hải Yến	1904
100707	Xã Gia Cát	1904
100706	Xã Công Sơn	1904
100705	Xã Cao Lâu	1904
100704	Xã Bình Trung	1904
100703	Xã Bảo Lâm	1904
100702	Thị trấn Đồng Đăng	1904
100701	Thị trấn Cao Lộc	1904
100108	Xã Quảng Lạc	1642
100107	Xã Mai Pha	1642
100106	Xã Hoàng Đồng	1642
100105	Phường Vĩnh Trại	1642
100104	Phường Tam Thanh	1642
100103	Phường Hoàng Văn Thụ	1642
100102	Phường Đông Kinh	1642
100101	Phường Chi Lăng	1642
800325	Xã Mỹ Hưng	3694
800324	Thị Trấn Hòa Thuận	3694
800323	Xã Tiên Thành	3694
800322	Xã Đại Sơn	3694
800321	Xã Cách Linh	3694
800320	Xã Bế Văn Đàn	3694
800319	Thị Trấn Tà Lùng	3694
800318	Xã Hạnh Phúc	3694
800317	Xã Ngọc Động	3694
800316	Xã Hồng Quang	3694
800315	Xã Tự Do	3694
800314	Xã Chí Thảo	3694
800313	Xã Phúc Sen	3694
800312	Xã Cai Bộ	3694
800311	Xã Độc Lập	3694
800310	Xã Quảng Hưng	3694
800309	Xã Phi Hải	3694
800308	Thị Trấn Quảng Uyên	3694
800307	Xã Quốc Toản	3694
60510	Xã Xuân Nội	3305
60509	Xã Tri Phương	3305
60508	Xã Quốc Toản	3305
60507	Xã Quang Vinh	3305
60506	Xã Quang Trung	3305
60505	Xã Quang Hán	3305
60504	Xã Lưu Ngọc	3305
60503	Xã Cô Mười	3305
60502	Xã Cao Chương	3305
60501	Thị trấn Hùng Quốc	3305
60311	Xã Yên Sơn	3299
60310	Xã Vị Quang	3299
60309	Xã Thanh Long	3299
60308	Xã Ngọc Động	3299
60307	Xã Lương Thông	3299
60306	Xã Lương Can	3299
60305	Xã Đa Thông	3299
60304	Xã Cần Yên	3299
60303	Xã Cần Nông	3299
60302	Xã Bình Lãng	3299
60301	Thị trấn Thông Nông	3299
61016	Xã Vân Trình	3289
61015	Xã Trọng Con	3289
61014	Xã Thụy Hùng	3289
61013	Xã Thị Ngân	3289
61012	Xã Thái Cường	3289
61011	Xã Quang Trọng	3289
61010	Xã Minh Khai	3289
61009	Xã Lê Lợi	3289
61008	Xã Lê Lai	3289
61007	Xã Kim Đồng	3289
61006	Xã Đức Xuân	3289
61005	Xã Đức Thông	3289
61004	Xã Đức Long	3289
61003	Xã Danh Sỹ	3289
61002	Xã Canh Tân	3289
61001	Thị trấn Đông Khê	3289
60917	Xã Tự Do	3259
60916	Xã Quốc Phong	3259
60915	Xã Quốc Dân	3259
60914	Xã Quảng Hưng	3259
60913	Xã Phúc Sen	3259
60912	Xã Phi Hải	3259
60911	Xã Ngọc Động	3259
60910	Xã Hồng Quang	3259
60909	Xã Hồng Định	3259
60908	Xã Hoàng Hải	3259
60907	Xã Hạnh Phúc	3259
60906	Xã Độc Lập	3259
60905	Xã Đoài Khôn	3259
60904	Xã Chí Thảo	3259
60903	Xã Cai Bộ	3259
60902	Xã Bình Lăng	3259
60901	Thị trấn Quảng Uyên	3259
800235	Xã Vũ Minh	3246
60720	Xã Yên Lạc	3246
60719	Xã Vũ Nông	3246
60718	Xã Triệu Nguyên	3246
60717	Xã Thịnh Vượng	3246
60716	Xã Thể Dục	3246
60715	Xã Thành Công	3246
60714	Xã Thái Học	3246
60713	Xã Tam Kim	3246
60712	Xã Quang Thành	3246
60711	Xã Phan Thanh	3246
60710	Xã Minh Thanh	3246
60709	Xã Minh Tâm	3246
60708	Xã Mai Long	3246
60707	Xã Lang Môn	3246
60706	Xã Hưng Đạo	3246
60705	Xã Hoa Thám	3246
60704	Xã Ca Thành	3246
60703	Xã Bắc Hợp	3246
60702	Thị trấn Tĩnh Túc	3246
60701	Thị trấn Nguyên Bình	3246
800234	Xã Thống Nhất	3194
61114	Xã Vinh Quý	3194
61113	Xã Việt Chu	3194
61112	Xã Thị Hoa	3194
61111	Xã Thắng Lợi	3194
61110	Xã Thái Đức	3194
61109	Xã Quang Long	3194
61108	Xã Minh Long	3194
61107	Xã Lý Quốc	3194
61106	Xã Kim Loan	3194
61105	Xã Đức Quang	3194
61104	Xã Đồng Loan	3194
61103	Xã Cô Ngân	3194
61102	Xã An Lạc	3194
61101	Thị trấn Thanh Nhật	3194
60217	Xã Xuân Trường	3130
60216	Xã Thượng Hà	3130
60215	Xã Sơn Lộ	3130
60214	Xã Sơn Lập	3130
60213	Xã Phan Thanh	3130
60212	Xã Kim Cúc	3130
60211	Xã Khánh Xuân	3130
60210	Xã Huy Giáp	3130
60209	Xã Hưng Thịnh	3130
60208	Xã Hưng Đạo	3130
60207	Xã Hồng Trị	3130
60206	Xã Hồng An	3130
60205	Xã Đình Phùng	3130
60204	Xã Cốc Pàng	3130
60203	Xã Cô Ba	3130
60202	Xã Bảo Toàn	3130
60201	Thị trấn Bảo Lạc	3130
90773	Thị trấn Hùng Quốc	2041
800233	Xã Đoài Dương	2041
800232	Xã Cao Chương	2041
800231	Xã Quang Vinh	2041
800230	Xã Quang Trung	2041
800229	Xã Xuân Nội	2041
800228	Xã Quang Hán	2041
800227	Xã Tri Phương	2041
800226	Thị Trấn Trà Lĩnh	2041
60620	Xã Trung Phúc	2041
60619	Xã Thông Hoè	2041
60618	Xã Thân Giáp	2041
60617	Xã Phong Nậm	2041
60616	Xã Phong Châu	2041
60615	Xã Ngọc Khê	2041
60614	Xã Ngọc Côn	2041
60613	Xã Ngọc Chung	2041
60612	Xã Lăng Yên	2041
60611	Xã Lăng Hiếu	2041
60610	Xã Khâm Thành	2041
60609	Xã Đức Hồng	2041
60608	Xã Đoài Côn	2041
60607	Xã Đình Phong	2041
60606	Xã Đình Minh	2041
60605	Xã Đàm Thuỷ	2041
60604	Xã Chí Viễn	2041
60603	Xã Cao Thăng	2041
60602	Xã Cảnh Tiên	2041
60601	Thị trấn Trùng Khánh	2041
61309	Xã Triệu ẩu	1997
61308	Xã Tiên Thành	1997
61307	Xã Mỹ Hưng	1997
61306	Xã Lương Thiện	1997
61305	Xã Hồng Đại	1997
61304	Xã Đại Sơn	1997
61303	Xã Cách Linh	1997
61302	Thị trấn Tà Lùng	1997
61301	Thị trấn Hoà Thuận	1997
60821	Xã Trương Vương	1943
60820	Xã Trương Lương	1943
60819	Xã Quang Trung	1943
60818	Xã Nguyễn Huệ	1943
60817	Xã Ngũ Lão	1943
60816	Xã Nam Tuấn	1943
60815	Xã Lê Chung	1943
60814	Xã Hồng Việt	1943
60813	Xã Hồng Nam	1943
60812	Xã Hoàng Tung	1943
60811	Xã Hà Trì	1943
60810	Xã Đức Xuân	1943
60809	Xã Đức Long	1943
60808	Xã Dân Chủ	1943
60807	Xã Đại Tiến	1943
60806	Xã Công Trừng	1943
60805	Xã Bình Long	1943
60804	Xã Bình Dương	1943
60803	Xã Bế Triều	1943
60802	Xã Bạch Đằng	1943
60801	Thị trấn Nước Hai	1943
800225	Xã Ngọc Đào	1939
800224	Xã Hồng Sỹ	1939
800223	Xã Thanh Long	1939
800222	Xã Lương Can	1939
800221	Xã Yên Sơn	1939
800220	Xã Ngọc Động	1939
800219	Xã Đa Thông	1939
800218	Xã Lương Thông	1939
800217	Xã Cần Nông	1939
800216	Xã Cần Yên	1939
800215	Thị Trấn Thông Nông	1939
60419	Xã Vần Dính	1939
60418	Xã Vân An	1939
60417	Xã Trường Hà	1939
60416	Xã Tổng Cọt	1939
60415	Xã Thượng Thôn	1939
60414	Xã Sóc Hà	1939
60413	Xã Sĩ Hai	1939
60412	Xã Quý Quân	1939
60411	Xã Phù Ngọc	1939
60410	Xã Nội Thôn	1939
60409	Xã Nà Sác	1939
60408	Xã Mã Ba	1939
60407	Xã Lũng Nặm	1939
60406	Xã Kéo Yên	1939
60405	Xã Hồng Sĩ	1939
60404	Xã Hạ Thôn	1939
60403	Xã Đào Ngạn	1939
60402	Xã Cải Viên	1939
60401	Thị trấn Xuân Hòa	1939
61214	Xã Yên Thổ	1890
61213	Xã Vĩnh Quang	1890
61212	Xã Vĩnh Phong	1890
61211	Xã Thái Sơn	1890
61210	Xã Thái Học	1890
61209	Xã Thạch Lâm	1890
61208	Xã Tân Việt	1890
61207	Xã Quảng Lâm	1890
61206	Xã Nam Quang	1890
61205	Xã Nam Cao	1890
61204	Xã Mông Ân	1890
61203	Xã Lý Bôn	1890
61202	Xã Đức Hạnh	1890
61201	Thị trấn Pác Miầu	1890
60111	Xã Vĩnh Quang	1641
60110	Xã Hưng Đạo	1641
60109	Xã Chu Trinh	1641
60108	Phường Tân Giang	1641
60107	Phường Sông Hiến	1641
60106	Phường Sông Bằng	1641
60105	Phường Ngọc Xuân	1641
60104	Phường Hợp Giang	1641
60103	Phường Hoà Chung	1641
60102	Phường Duyệt Trung	1641
60101	Phường Đề Thám	1641
110810	Xã Xuân La	3249
110809	Xã Nhạn Môn	3249
110808	Xã Nghiên Loan	3249
110807	Xã Giáo Hiệu	3249
110806	Xã Công Bằng	3249
110805	Xã Cổ Linh	3249
110804	Xã Cao Tân	3249
110803	Xã Bộc Bố	3249
110802	Xã Bằng Thành	3249
110801	Xã An Thắng	3249
800236	Xã Hiệp Lực	3242
110511	Xã Vân Tùng	3242
110510	Xã Trung Hoà	3242
110509	Xã Thượng Quan	3242
110508	Xã Thượng Ân	3242
110507	Xã Thuần Mang	3242
110506	Xã Lãng Ngâm	3242
110505	Xã Hương Nê	3242
110504	Xã Đức Vân	3242
110503	Xã Cốc Đán	3242
110502	Xã Bằng Vân	3242
110501	Thị trấn Nà Phặc	3242
800246	Xã Trần Phú	3232
800245	Xã Sơn Thành	3232
800244	Xã Văn Lang	3232
800243	Xã Văn Vũ	3232
110422	Xã Xuân Dương	3232
110421	Xã Vũ Loan	3232
110420	Xã Văn Minh	3232
110419	Xã Văn Học	3232
110418	Xã Quang Phong	3232
110417	Xã Lương Thượng	3232
110416	Xã Lương Thành	3232
110415	Xã Lương Hạ	3232
110414	Xã Liêm Thuỷ	3232
110413	Xã Lạng San	3232
110412	Xã Lam Sơn	3232
110411	Xã Kim Lư	3232
110410	Xã Kim Hỷ	3232
110409	Xã Hữu Thác	3232
110408	Xã Hảo Nghĩa	3232
110407	Xã Dương Sơn	3232
110406	Xã Đổng Xá	3232
110405	Xã Cường Lợi	3232
110404	Xã Cư Lễ	3232
110403	Xã Côn Minh	3232
110402	Xã Ân Tình	3232
110401	Thị trấn Yến Lạc	3232
800242	Xã Thanh Thịnh	1914
800241	Thị Trấn Đồng Tâm	1914
11079	Xã Quảng Chu	1914
11078	Xã Nông Thịnh	1914
11077	Xã Nông Hạ	1914
11076	Xã Như Cố	1914
11075	Xã Mai Lạp	1914
11074	Xã Hoà Mục	1914
11073	Xã Cao Kỳ	1914
11072	Xã Bình Văn	1914
110716	Xã Yên Hân	1914
110715	Xã Yên Đĩnh	1914
110714	Xã Yên Cư	1914
110713	Xã Thanh Vận	1914
110712	Xã Thanh Mai	1914
110711	Xã Thanh Bình	1914
110710	Xã Tân Sơn	1914
11071	Thị trấn Chợ Mới	1914
800240	Xã Yên Phong	1913
800239	Xã Đồng Thắng	1913
110222	Xã Yên Thượng	1913
110221	Xã Yên Thịnh	1913
110220	Xã Yên Nhuận	1913
110219	Xã Yên Mỹ	1913
110218	Xã Xuân Lạc	1913
110217	Xã Tân Lập	1913
110216	Xã Rã Bản	1913
110215	Xã Quảng Bạch	1913
110214	Xã Phương Viên	1913
110213	Xã Phong Huân	1913
110212	Xã Ngọc Phái	1913
110211	Xã Nghĩa Tá	1913
110210	Xã Nam Cường	1913
110209	Xã Lương Bằng	1913
110208	Xã Đông Viên	1913
110207	Xã Đồng Lạc	1913
110206	Xã Đại Sảo	1913
110205	Xã Bình Trung	1913
110204	Xã Bằng Phúc	1913
110203	Xã Bằng Lãng	1913
110202	Xã Bản Thi	1913
110201	Thị trấn Bằng Lũng	1913
800238	Xã Quân Hà	1889
800237	Xã Tân Tú	1889
110317	Xã Vũ Muộn	1889
110316	Xã Vi Hương	1889
110315	Xã Tú Trĩ	1889
110314	Xã Tân Tiến	1889
110313	Xã Sĩ Bình	1889
110312	Xã Quang Thuận	1889
110311	Xã Quân Bình	1889
110310	Xã Phương Linh	1889
110309	Xã Nguyên Phúc	1889
110308	Xã Mỹ Thanh	1889
110307	Xã Lục Bình	1889
110306	Xã Hà Vị	1889
110305	Xã Dương Phong	1889
110304	Xã Đôn Phong	1889
110303	Xã Cao Sơn	1889
110302	Xã Cẩm Giàng	1889
110301	Thị trấn Phủ Thông	1889
110616	Xã Yến Dương	1887
110615	Xã Thượng Giáo	1887
110614	Xã Quảng Khê	1887
110613	Xã Phúc Lộc	1887
110612	Xã Nam Mẫu	1887
110611	Xã Mỹ Phương	1887
110610	Xã Khang Ninh	1887
110609	Xã Hoàng Trĩ	1887
110608	Xã Hà Hiệu	1887
110607	Xã Đồng Phúc	1887
110606	Xã Địa Linh	1887
110605	Xã Chu Hương	1887
110604	Xã Cao Trĩ	1887
110603	Xã Cao Thượng	1887
110602	Xã Bành Trạch	1887
110601	Thị trấn Chợ Rã	1887
110108	Xã Nông Thượng	1640
110107	Xã Dương Quang	1640
110106	Phường Xuất Hóa	1640
110105	Phường Sông Cầu	1640
110104	Phường Phùng Chí Kiên	1640
110103	Phường Nguyễn Thị Minh Khai	1640
110102	Phường Huyền Tụng	1640
110101	Phường Đức Xuân	1640
120416	Xã Yên Trạch	2195
120415	Xã Yên Ninh	2195
120414	Xã Yên Lạc	2195
120413	Xã Yên Đổ	2195
120412	Xã Vô Tranh	2195
120411	Xã Tức Tranh	2195
120410	Xã Sơn Cẩm	2195
120409	Xã Phủ Lý	2195
120408	Xã Phú Đô	2195
120407	Xã Phấn Mễ	2195
120406	Xã Ôn Lương	2195
120405	Xã Hợp Thành	2195
120404	Xã Động Đạt	2195
120403	Xã Cổ Lũng	2195
120402	Thị trấn Giang Tiên	2195
120401	Thị trấn Đu	2195
120515	Xã Vũ Chấn	2051
120514	Xã Tràng Xá	2051
120513	Xã Thượng Nung	2051
120512	Xã Thần Xa	2051
120511	Xã Sảng Mộc	2051
120510	Xã Phương Giao	2051
120509	Xã Phú Thượng	2051
120508	Xã Nghinh Tường	2051
120507	Xã Liên Minh	2051
120506	Xã Lâu Thượng	2051
120505	Xã La Hiên	2051
120504	Xã Dân Tiến	2051
120503	Xã Cúc Đường	2051
120502	Xã Bình Long	2051
120501	Thị trấn Đình Cả	2051
120821	Xã Xuân Phương	1991
120820	Xã Úc Kỳ	1991
120819	Xã Thượng Đình	1991
120818	Xã Thanh Ninh	1991
120817	Xã Tân Thành	1991
120816	Xã Tân Kim	1991
120815	Xã Tân Khánh	1991
120814	Xã Tân Hòa	1991
120813	Xã Tân Đức	1991
120812	Xã Nhã Lộng	1991
120811	Xã Nga My	1991
120810	Xã Lương Phú	1991
120809	Xã Kha Sơn	1991
120808	Xã Hà Châu	1991
120807	Xã Dương Thành	1991
120806	Xã Đồng Liên	1991
120805	Xã Điềm Thụy	1991
120804	Xã Đào Xá	1991
120803	Xã Bảo Lý	1991
120802	Xã Bàn Đạt	1991
120801	Thị trấn Hương Sơn	1991
120918	Xã Vạn Phái	1990
120917	Xã Trung Thành	1990
120916	Xã Tiên Phong	1990
120915	Xã Thuận Thành	1990
120914	Xã Thành Công	1990
120913	Xã Tân Phú	1990
120912	Xã Tân Hương	1990
120911	Xã Phúc Thuận	1990
120910	Xã Phúc Tân	1990
120909	Xã Nam Tiến	1990
120908	Xã Minh Đức	1990
120907	Xã Hồng Tiến	1990
120906	Xã Đông Cao	1990
120905	Xã Đắc Sơn	1990
120904	Phường Đồng Tiến	1990
120903	Phường Bãi Bông	1990
120902	Phường Bắc Sơn	1990
120901	Phường Ba Hàng	1990
120324	Xã Trung Lương	1924
120323	Xã Trung Hội	1924
120322	Xã Thanh Định	1924
120321	Xã Tân Thịnh	1924
120320	Xã Tân Dương	1924
120319	Xã Sơn Phú	1924
120318	Xã Quy Kỳ	1924
120317	Xã Phượng Tiến	1924
120316	Xã Phúc Chu	1924
120315	Xã Phú Tiến	1924
120314	Xã Phú Đình	1924
120313	Xã Linh Thông	1924
120312	Xã Lam Vỹ	1924
120311	Xã Kim Sơn	1924
120310	Xã Kim Phượng	1924
120309	Xã Đồng Thịnh	1924
120308	Xã Định Biên	1924
120307	Xã Điềm Mặc	1924
120306	Xã Bộc Nhiêu	1924
120305	Xã Bình Yên	1924
120304	Xã Bình Thành	1924
120303	Xã Bảo Linh	1924
120302	Xã Bảo Cường	1924
120301	Thị trấn Chợ Chu	1924
91298	Xã Vạn Phú	1918
120630	Xã Yên Lãng	1918
120629	Xã Văn Yên	1918
120628	Xã Vạn Thọ	1918
120627	Xã Tiên Hội	1918
120626	Xã Tân Thái	1918
120625	Xã Tân Linh	1918
120624	Xã Quân Chu	1918
120623	Xã Phúc Lương	1918
120622	Xã Phục Linh	1918
120621	Xã Phú Xuyên	1918
120620	Xã Phú Thịnh	1918
120619	Xã Phú Lạc	1918
120618	Xã Phú Cường	1918
120617	Xã Na Mao	1918
120616	Xã Mỹ Yên	1918
120615	Xã Minh Tiến	1918
120614	Xã Lục Ba	1918
120613	Xã La Bằng	1918
120612	Xã Ký Phú	1918
120611	Xã Khôi Kỳ	1918
120610	Xã Hoàng Nông	1918
120609	Xã Hà Thượng	1918
120608	Xã Đức Lương	1918
120607	Xã Cù Vân	1918
120606	Xã Cát Nê	1918
120605	Xã Bình Thuận	1918
120604	Xã Bản Ngoại	1918
120603	Xã An Khánh	1918
120602	Thị trấn Quân Chu	1918
120601	Thị trấn Hùng Sơn	1918
90793	Xã Cao Ngạn	1731
120718	Xã Văn Lăng	1731
120717	Xã Văn Hán	1731
120716	Xã Tân Long	1731
120715	Xã Tân Lợi	1731
120714	Xã Quang Sơn	1731
120713	Xã Nam Hòa	1731
120712	Xã Minh Lập	1731
120711	Xã Linh Sơn	1731
120710	Xã Khe Mo	1731
120709	Xã Huống Thượng	1731
120708	Xã Hợp Tiến	1731
120707	Xã Hóa Trung	1731
120706	Xã Hóa Thượng	1731
120705	Xã Hòa Bình	1731
120704	Xã Cây Thị	1731
120703	Thị trấn Trại Cau	1731
120702	Thị trấn Sông Cầu	1731
120701	Thị trấn Chùa Hang	1731
800209	Phường Châu Sơn	1684
120211	Xã Vinh Sơn	1684
120210	Xã Tân Quang	1684
120209	Xã Bình Sơn	1684
120208	Xã Bá Xuyên	1684
120207	Phường Thắng Lợi	1684
120206	Phường Phố Cò	1684
120205	Phường Mỏ Chè	1684
120204	Phường Lương Sơn	1684
120203	Phường Lương Châu	1684
120202	Phường Cải Đan	1684
120201	Phường Bách Quang	1684
800211	Xã Sơn Cẩm	1639
800210	Phường Chùa Hang	1639
800199	Xã Đồng Liên	1639
800198	Xã Linh Sơn	1639
800197	Xã Huống Thượng	1639
120127	Xã Thịnh Đức	1639
120126	Xã Tân Cương	1639
120125	Xã Quyết Thắng	1639
120124	Xã Phúc Xuân	1639
120123	Xã Phúc Trìu	1639
120122	Xã Phúc Hà	1639
120121	Phường Đồng Bẩm	1639
120120	Xã Cao Ngạn	1639
120119	Phường Túc Duyên	1639
120118	Phường Trưng Vương	1639
120117	Phường Trung Thành	1639
120116	Phường Tích Lương	1639
120115	Phường Thịnh Đán	1639
120114	Phường Tân Thịnh	1639
120113	Phường Tân Thành	1639
120112	Phường Tân Long	1639
120111	Phường Tân Lập	1639
120110	Phường Quang Vinh	1639
120109	Phường Quang Trung	1639
120108	Phường Quán Triều	1639
120107	Phường Phú Xá	1639
120106	Phường Phan Đình Phùng	1639
120105	Phường Hương Sơn	1639
120104	Phường Hoàng Văn Thụ	1639
120103	Phường Gia Sàng	1639
120102	Phường Đồng Quang	1639
120101	Phường Cam Giá	1639
91587	Xã Bình Định	2239
340822	Xã Bình Tú	2239
340821	Xã Bình Trung	2239
340820	Xã Bình Triều	2239
340819	Xã Bình Trị	2239
340818	Xã Bình Sa	2239
340817	Xã Bình Quý	2239
340816	Xã Bình Quế	2239
340815	Xã Bình Phục	2239
340814	Xã Bình Phú	2239
340813	Xã Bình Nguyên	2239
340812	Xã Bình Nam	2239
340811	Xã Bình Minh	2239
340810	Xã Bình Lãnh	2239
340809	Xã Bình Hải	2239
340808	Xã Bình Giang	2239
340807	Xã Bình Dương	2239
340806	Xã Bình Định Nam	2239
340805	Xã Bình Định Bắc	2239
340804	Xã Bình Đào	2239
340803	Xã Bình Chánh	2239
340802	Xã Bình An	2239
340801	Thị trấn Hà Lam	2239
341015	Xã Tiên Thọ	2224
341014	Xã Tiên Sơn	2224
341013	Xã Tiên Phong	2224
341012	Xã Tiên Ngọc	2224
341011	Xã Tiên Mỹ	2224
341010	Xã Tiên Lộc	2224
341009	Xã Tiên Lập	2224
341008	Xã Tiên Lãnh	2224
341007	Xã Tiên Hiệp	2224
341006	Xã Tiên Hà	2224
341005	Xã Tiên Châu	2224
341004	Xã Tiên Cảnh	2224
341003	Xã Tiên Cẩm	2224
341002	Xã Tiên An	2224
341001	Thị trấn Tiên Kỳ	2224
341610	Xã Tr'Hy	2219
341609	Xã Lăng	2219
341608	Xã Ga Ri	2219
341607	Xã Dang	2219
341606	Xã Ch'ơm	2219
341605	Xã Bha Lê	2219
341604	Xã A Xan	2219
341603	Xã A Vương	2219
341602	Xã A Tiêng	2219
341601	Xã A Nông	2219
341412	Xã Phước Xuân	2198
341411	Xã Phước Thành	2198
341410	Xã Phước Năng	2198
341409	Xã Phước Mỹ	2198
341408	Xã Phước Lộc	2198
341407	Xã Phước Kim	2198
341406	Xã Phước Hoà	2198
341405	Xã Phước Hiệp	2198
341404	Xã Phước Đức	2198
341403	Xã Phước Công	2198
341402	Xã Phước Chánh	2198
341401	Thị trấn Khâm Đức	2198
800291	Xã Ninh Phước	2182
341807	Xã Sơn Viên	2182
341806	Xã Quế Trung	2182
341805	Xã Quế Phước	2182
341804	Xã Quế Ninh	2182
341803	Xã Quế Lộc	2182
341802	Xã Quế Lâm	2182
341801	Xã Phước Ninh	2182
341510	Xã Trà Vinh	2178
341509	Xã Trà Vân	2178
341508	Xã Trà Tập	2178
341507	Xã Trà Nam	2178
341506	Xã Trà Mai	2178
341505	Xã Trà Linh	2178
341504	Xã Trà Leng	2178
341503	Xã Trà Dơn	2178
341502	Xã Trà Don	2178
341501	Xã Trà Cang	2178
341312	Xã Zuôih	2177
341311	Xã Tà Pơơ	2177
341310	Xã Tà Bhinh	2177
341309	Xã Laêê	2177
341308	Xã La Dêê	2177
341307	Xã Đắc Tôi	2177
341306	Xã Đắc Pring	2177
341305	Xã Đắc Pre	2177
341304	Xã Chơ Chun	2177
341303	Xã Chà Vàl	2177
341302	Xã Cà Dy	2177
341301	Thị trấn Thạnh Mỹ	2177
91586	Xã Quế Tân	2139
800290	Thị Trấn Tân Bình	2139
340712	Xã Thăng Phước	2139
340711	Xã Sông Trà	2139
340710	Xã Quế Thọ	2139
340709	Xã Quế Lưu	2139
340708	Xã Quế Bình	2139
340707	Xã Phước Trà	2139
340706	Xã Phước Gia	2139
340705	Xã Hiệp Thuận	2139
340704	Xã Hiệp Hòa	2139
340703	Xã Bình Sơn	2139
340702	Xã Bình Lâm	2139
340701	Thị trấn Tân An	2139
341211	Xã Za Hung	2125
341210	Xã Tà Lu	2125
341209	Xã Sông Kôn	2125
341208	Xã Mà Cooi	2125
341207	Xã Ka Dăng	2125
341206	Xã Jơ Ngây	2125
341205	Xã Ba	2125
341204	Xã A Ting	2125
341203	Xã A Rooi	2125
341202	Xã  Tư	2125
341201	Thị trấn P Rao	2125
341113	Xã Trà Tân	2078
341112	Xã Trà Sơn	2078
341111	Xã Trà Nú	2078
341110	Xã Trà Kót	2078
341109	Xã Trà Ka	2078
341108	Xã Trà Giáp	2078
341107	Xã Trà Giang	2078
341106	Xã Trà Giác	2078
341105	Xã Trà Dương	2078
341104	Xã Trà Đông	2078
341103	Xã Trà Đốc	2078
341102	Xã Trà Bui	2078
341101	Thị trấn Trà My	2078
91632	Xã Quế Phước	2003
91585	Xã Quế Lâm	2003
91584	Xã Quế Lộc	2003
91583	Xã Phước Ninh	2003
91582	Xã Ninh Phước	2003
91581	Thị trấn Trung Phước	2003
800289	Xã Quế Mỹ	2003
340614	Xã Quế Xuân 2	2003
340613	Xã Quế Xuân 1	2003
340612	Xã Quế Thuận	2003
340611	Xã Quế Phú	2003
340610	Xã Quế Phong	2003
340609	Xã Quế Minh	2003
340608	Xã Quế Long	2003
340607	Xã Quế Hiệp	2003
340606	Xã Quế Cường	2003
340605	Xã Quế Châu	2003
340604	Xã Quế An	2003
340603	Xã Phú Thọ	2003
340602	Xã Hương An	2003
340601	Thị trấn Đông Phú	2003
341711	Xã Tam Vinh	1995
341710	Xã Tam Thành	1995
341709	Xã Tam Thái	1995
341708	Xã Tam Phước	1995
341707	Xã Tam Lộc	1995
341706	Xã Tam Lãnh	1995
341705	Xã Tam Đàn	1995
341704	Xã Tam Dân	1995
341703	Xã Tam Đại	1995
341702	Xã Tam An	1995
341701	Thị trấn Phú Thịnh	1995
340917	Xã Tam Xuân II	1987
340916	Xã Tam Xuân I	1987
340915	Xã Tam Trà	1987
340914	Xã Tam Tiến	1987
340913	Xã Tam Thạnh	1987
340912	Xã Tam Sơn	1987
340911	Xã Tam Quang	1987
340910	Xã Tam Nghĩa	1987
340909	Xã Tam Mỹ Tây	1987
340908	Xã Tam Mỹ Đông	1987
340907	Xã Tam Hòa	1987
340906	Xã Tam Hiệp	1987
340905	Xã Tam Hải	1987
340904	Xã Tam Giang	1987
340903	Xã Tam Anh Nam	1987
340902	Xã Tam Anh Bắc	1987
340901	Thị trấn Núi Thành	1987
340518	Xã Đại Thạnh	1917
340517	Xã Đại Thắng	1917
340516	Xã Đại Tân	1917
340515	Xã Đại Sơn	1917
340514	Xã Đại Quang	1917
340513	Xã Đại Phong	1917
340512	Xã Đại Nghĩa	1917
340511	Xã Đại Minh	1917
340510	Xã Đại Lãnh	1917
340509	Xã Đại Hưng	1917
340508	Xã Đại Hồng	1917
340507	Xã Đại Hòa	1917
340506	Xã Đại Hiệp	1917
340505	Xã Đại Đồng	1917
340504	Xã Đại Cường	1917
340503	Xã Đại Chánh	1917
340502	Xã Đại An	1917
340501	Thị Trấn Ái Nghĩa	1917
340420	Xã Điện Trung	1736
340419	Xã Điện Tiến	1736
340418	Xã Điện Thọ	1736
340417	Xã Điện Thắng Trung	1736
340416	Xã Điện Thắng Nam	1736
340415	Xã Điện Thắng Bắc	1736
340414	Xã Điện Quang	1736
340413	Xã Điện Phương	1736
340412	Xã Điện Phước	1736
340411	Xã Điện Phong	1736
340410	Xã Điện Minh	1736
340409	Xã Điện Hồng	1736
340408	Xã Điện Hòa	1736
340407	Phường Vĩnh Điện	1736
340406	Phường Điện Ngọc	1736
340405	Phường Điện Nam Trung	1736
340404	Phường Điện Nam Đông	1736
340403	Phường Điện Nam Bắc	1736
340402	Phường Điện Dương	1736
340401	Phường Điện An	1736
340314	Xã Duy Vinh	1735
340313	Xã Duy Trung	1735
340312	Xã Duy Trinh	1735
340311	Xã Duy Thu	1735
340310	Xã Duy Thành	1735
340309	Xã Duy Tân	1735
340308	Xã Duy Sơn	1735
340307	Xã Duy Phước	1735
340306	Xã Duy Phú	1735
340305	Xã Duy Nghĩa	1735
340304	Xã Duy Hòa	1735
340303	Xã Duy Hải	1735
340302	Xã Duy Châu	1735
340301	Thị trấn Nam Phước	1735
340213	Xã Tân Hiệp	1632
340212	Xã Cẩm Thanh	1632
340211	Xã Cẩm Kim	1632
340210	Xã Cẩm Hà	1632
340209	Phường Thanh Hà	1632
340208	Phường Tân An	1632
340207	Phường Sơn Phong	1632
340206	Phường Minh An	1632
340205	Phường Cửa Đại	1632
340204	Phường Cẩm Phô	1632
340203	Phường Cẩm Nam	1632
340202	Phường Cẩm Châu	1632
340201	Phường Cẩm An	1632
340113	Xã Tam Thanh	1631
340112	Xã Tam Thăng	1631
340111	Xã Tam Phú	1631
340110	Xã Tam Ngọc	1631
340109	Phường Trường Xuân	1631
340108	Phường Tân Thạnh	1631
340107	Phường Phước Hòa	1631
340106	Phường Hoà Thuận	1631
340105	Phường Hòa Hương	1631
340104	Phường An Xuân	1631
340103	Phường An Sơn	1631
340102	Phường An Phú	1631
340101	Phường An Mỹ	1631
800299	Xã Trà Tây	3304
800298	Xã Trà Xinh	3304
800297	Xã Hương Trà	3304
800296	Xã Trà Phong	3304
800295	Xã Sơn Trà	3304
800294	Xã Trà Thanh	3304
350410	Xã Trà Thủy	3304
350409	Xã Trà Tân	3304
350408	Xã Trà Sơn	3304
350407	Xã Trà Phú	3304
350406	Xã Trà Lâm	3304
350405	Xã Trà Hiệp	3304
350404	Xã Trà Giang	3304
350403	Xã Trà Bùi	3304
350402	Xã Trà Bình	3304
350401	Thị trấn Trà Xuân	3304
351309	Xã Sơn Tinh	3270
351308	Xã Sơn Tân	3270
351307	Xã Sơn Mùa	3270
351306	Xã Sơn Màu	3270
351305	Xã Sơn Long	3270
351304	Xã Sơn Liên	3270
351303	Xã Sơn Lập	3270
351302	Xã Sơn Dung	3270
351301	Xã Sơn Bua	3270
91589	Xã Thắng Lợi	3226
351013	Xã Đức Thạnh	3226
351012	Xã Đức Thắng	3226
351011	Xã Đức Tân	3226
351010	Xã Đức Phú	3226
351009	Xã Đức Phong	3226
351008	Xã Đức Nhuận	3226
351007	Xã Đức Minh	3226
351006	Xã Đức Lợi	3226
351005	Xã Đức Lân	3226
351004	Xã Đức Hòa	3226
351003	Xã Đức Hiệp	3226
351002	Xã Đức Chánh	3226
351001	Thị trấn Mộ Đức	3226
351220	Xã Ba Xa	3127
351219	Xã Ba Vinh	3127
351218	Xã Ba Vì	3127
351217	Xã Ba Trang	3127
351216	Xã Ba Tô	3127
351215	Xã Ba Tiêu	3127
351214	Xã Ba Thành	3127
351213	Xã Ba Ngạc	3127
351212	Xã Ba Nam	3127
351211	Xã Ba Liên	3127
351210	Xã Ba Lế	3127
351209	Xã Ba Khâm	3127
351208	Xã Ba Giang	3127
351207	Xã Ba Động	3127
351206	Xã Ba Dinh	3127
351205	Xã Ba Điền	3127
351204	Xã Ba Cung	3127
351203	Xã Ba Chùa	3127
351202	Xã Ba Bích	3127
351201	Thị trấn Ba Tơ	3127
351409	Xã Trà Xinh	2222
351408	Xã Trà Trung	2222
351407	Xã Trà Thọ	2222
351406	Xã Trà Thanh	2222
351405	Xã Trà Quân	2222
351404	Xã Trà Phong	2222
351403	Xã Trà Nham	2222
351402	Xã Trà Lãnh	2222
351401	Xã Trà Khê	2222
350614	Xã Sơn Trung	2210
350613	Xã Sơn Thủy	2210
350612	Xã Sơn Thượng	2210
350611	Xã Sơn Thành	2210
350610	Xã Sơn Nham	2210
350609	Xã Sơn Linh	2210
350608	Xã Sơn Kỳ	2210
350607	Xã Sơn Hải	2210
350606	Xã Sơn Hạ	2210
350605	Xã Sơn Giang	2210
350604	Xã Sơn Cao	2210
350603	Xã Sơn Bao	2210
350602	Xã Sơn Ba	2210
350601	Thị trấn Di Lăng	2210
350905	Xã Thanh An	2167
350904	Xã Long Sơn	2167
350903	Xã Long Môn	2167
350902	Xã Long Mai	2167
350901	Xã Long Hiệp	2167
350203	Xã An Vĩnh	2114
350202	Xã An Hải	2114
350201	Xã An Bình	2114
350812	Xã Hành Trung	1988
350811	Xã Hành Tín Tây	1988
350810	Xã Hành Tín  Đông	1988
350809	Xã Hành Thuận	1988
350808	Xã Hành Thịnh	1988
350807	Xã Hành Thiện	1988
350806	Xã Hành Phước	1988
350805	Xã Hành Nhân	1988
350804	Xã Hành Minh	1988
350803	Xã Hành Dũng	1988
350802	Xã Hành Đức	1988
350801	Thị trấn Chợ Chùa	1988
800300	Phường Nguyễn Nghiêm	1930
351115	Xã Phổ Vinh	1930
351114	Xã Phổ Văn	1930
351113	Xã Phổ Thuận	1930
351112	Xã Phổ Thạnh	1930
351111	Xã Phổ Quang	1930
351110	Xã Phổ Phong	1930
351109	Xã Phổ Ninh	1930
351108	Xã Phổ Nhơn	1930
351107	Xã Phổ Minh	1930
351106	Xã Phổ Khánh	1930
351105	Xã Phổ Hòa	1930
351104	Xã Phổ Cường	1930
351103	Xã Phổ Châu	1930
351102	Xã Phổ An	1930
351101	Thị trấn Đức Phổ	1930
800293	Xã Bình Tân Phú	1898
800292	Xã Bình Thanh	1898
350325	Xã Bình Trung	1898
350324	Xã Bình Trị	1898
350323	Xã Bình Thuận	1898
350322	Xã Bình Thới	1898
350321	Xã Bình Thanh Tây	1898
350320	Xã Bình Thanh Đông	1898
350319	Xã Bình Thạnh	1898
350318	Xã Bình Tân	1898
350317	Xã Bình Phước	1898
350316	Xã Bình Phú	1898
350315	Xã Bình Nguyên	1898
350314	Xã Bình Mỹ	1898
350313	Xã Bình Minh	1898
350312	Xã Bình Long	1898
350311	Xã Bình Khương	1898
350310	Xã Bình Hòa	1898
350309	Xã Bình Hiệp	1898
350308	Xã Bình Hải	1898
350307	Xã Bình Dương	1898
350306	Xã Bình Đông	1898
350305	Xã Bình Chương	1898
350304	Xã Bình Châu	1898
350303	Xã Bình Chánh	1898
350302	Xã Bình An	1898
350301	Thị Trấn Châu Ổ	1898
350715	Xã Nghĩa Trung	1738
350714	Xã Nghĩa Thương	1738
350713	Xã Nghĩa Thuận	1738
350712	Xã Nghĩa Thọ	1738
350711	Xã Nghĩa Thắng	1738
350710	Xã Nghĩa Sơn	1738
350709	Xã Nghĩa Phương	1738
350708	Xã Nghĩa Mỹ	1738
350707	Xã Nghĩa Lâm	1738
350706	Xã Nghĩa Kỳ	1738
350705	Xã Nghĩa Hòa	1738
350704	Xã Nghĩa Hiệp	1738
350703	Xã Nghĩa Điền	1738
350702	Thị trấn Sông Vệ	1738
350701	Thị trấn La Hà	1738
90786	Xã Sơn Hòa	1737
90785	Xã Sơn Hội	1737
90784	Xã Sơn Hải	1737
90783	Xã Sơn Mỹ	1737
90782	Xã Sơn Quang	1737
90781	Xã Sơn Thành	1737
350511	Xã Tịnh Trà	1737
350510	Xã Tịnh Thọ	1737
350509	Xã Tịnh Sơn	1737
350508	Xã Tịnh Phong	1737
350507	Xã Tịnh Minh	1737
350506	Xã Tịnh Hiệp	1737
350505	Xã Tịnh Hà	1737
350504	Xã Tịnh Giang	1737
350503	Xã Tịnh Đông	1737
350502	Xã Tịnh Bình	1737
350501	Xã Tịnh Bắc	1737
91588	Xã An Phú	1630
350123	Xã Tịnh Thiện	1630
350122	Xã Tịnh Long	1630
350121	Xã Tịnh Kỳ	1630
350120	Xã Tịnh Khê	1630
350119	Xã Tịnh Hòa	1630
350118	Xã Tịnh Châu	1630
350117	Xã Tịnh Ấn Tây	1630
350116	Xã Tịnh Ấn Đông	1630
350115	Xã Tịnh An	1630
350114	Xã Nghĩa Phú	1630
350113	Xã Nghĩa Hà	1630
350112	Xã Nghĩa Dũng	1630
350111	Xã Nghĩa Dõng	1630
350110	Xã Nghĩa An	1630
350109	Phường Trương Quang Trọng	1630
350108	Phường Trần Phú	1630
350107	Phường Trần Hưng Đạo	1630
350106	Phường Quảng Phú	1630
350105	Phường Nguyễn Nghiêm	1630
350104	Phường Nghĩa Lộ	1630
350103	Phường Nghĩa Chánh	1630
350102	Phường Lê Hồng Phong	1630
350101	Phường Chánh Lộ	1630
630408	Xã Trúc Sơn	3152
630407	Xã Tâm Thắng	3152
630406	Xã Nam Dong	3152
630405	Xã Ea Pô	3152
630404	Xã Đắk Wil	3152
630403	Xã Đắk DRông	3152
630402	Xã Cư Knia	3152
630401	Thị trấn Ea T'Ling	3152
630806	Xã Quảng Trực	2227
630805	Xã Quảng Tân	2227
630804	Xã Quảng Tâm	2227
630803	Xã Đắk R'Tíh	2227
630802	Xã Đắk Ngo	2227
630801	Xã Đắk Búk So	2227
630612	Xã Tân Thành	2151
630611	Xã Quảng Phú	2151
630610	Xã Nam Xuân	2151
630609	Xã Nâm Nung	2151
630608	Xã Nâm N'Đir	2151
630607	Xã Nam Đà	2151
630606	Xã Đức Xuyên	2151
630605	Xã Đắk Sôr	2151
630604	Xã Đắk Nang	2151
630603	Xã Đắk Drô	2151
630602	Xã Buôn Choah	2151
630601	Thị trấn Đắk Mâm	2151
630509	Xã Trường Xuân	2120
630508	Xã Thuận Hạnh	2120
630507	Xã Thuận Hà	2120
630506	Xã Nâm N'Jang	2120
630505	Xã Nam Bình	2120
630504	Xã Đắk N'Dung	2120
630503	Xã Đắk Môl	2120
630502	Xã Đắk Hòa	2120
630501	Thị trấn Đức An	2120
630310	Xã Thuận An	1792
630309	Xã Long Sơn	1792
630308	Xã Đức Minh	1792
630307	Xã Đức Mạnh	1792
630306	Xã Đắk Sắk	1792
630305	Xã Đắk R'La	1792
630304	Xã Đắk N'Drót	1792
630303	Xã Đắk Gằn	1792
630302	Xã Đắk Lao	1792
630301	Thị trấn Đắk Mil	1792
630707	Xã Quảng Sơn	1791
630706	Xã Quảng Khê	1791
630705	Xã Quảng Hoà	1791
630704	Xã Đắk Som	1791
630703	Xã Đắk R'Măng	1791
630702	Xã Đắk Plao	1791
630701	Xã Đắk Ha	1791
630211	Xã Quảng Tín	1790
630210	Xã Nhân Đạo	1790
630209	Xã Nhân Cơ	1790
630208	Xã Nghĩa Thắng	1790
630207	Xã Kiến Thành	1790
630206	Xã Hưng Bình	1790
630205	Xã Đạo Nghĩa	1790
630204	Xã Đắk Wer	1790
630203	Xã Đắk Sin	1790
630202	Xã Đắk Ru	1790
630201	Thị trấn Kiến Đức	1790
630108	Xã Quảng Thành	1627
630107	Xã Đăk R'Moan	1627
630106	Xã Đắk Nia	1627
630105	Phường Nghĩa Trung	1627
630104	Phường Nghĩa Thành	1627
630103	Phường Nghĩa Tân	1627
630102	Phường Nghĩa Phú	1627
630101	Phường Nghĩa Đức	1627
800303	Xã Phước Bình	2035
460911	Xã Phước Lưu	2035
460910	Xã Phước Chỉ	2035
460909	Xã Lộc Hưng	2035
460908	Xã Hưng Thuận	2035
460907	Phường Gia Lộc	2035
460906	Xã Gia Bình	2035
460905	Xã Đôn Thuận	2035
460904	Xã Bình Thạnh	2035
460903	Xã An Tịnh	2035
460902	Xã An Hòa	2035
460901	Thị trấn Trảng Bàng	2035
460809	Xã Thanh Phước	1866
460808	Xã Thạnh Đức	1866
460807	Xã Phước Trạch	1866
460806	Xã Phước Thạnh	1866
460805	Xã Phước Đông	1866
460804	Xã Hiệp Thạnh	1866
460803	Xã Cẩm Giang	1866
460802	Xã Bàu Đồn	1866
460801	Thị trấn Gò Dầu	1866
460709	Xã Tiên Thuận	1865
460708	Xã Long Thuận	1865
460707	Xã Long Phước	1865
460706	Xã Long Khánh	1865
460705	Xã Long Giang	1865
460704	Xã Long Chữ	1865
460703	Xã Lợi Thuận	1865
460702	Xã An Thạnh	1865
460701	Thị trấn Bến Cầu	1865
460411	Xã Truông Mít	1864
460410	Xã Suối Đá	1864
460409	Xã Phước Ninh	1864
460408	Xã Phước Minh	1864
460407	Xã Phan	1864
460406	Xã Lộc Ninh	1864
460405	Xã Chà Là	1864
460404	Xã Cầu Khởi	1864
460403	Xã Bến Củi	1864
460402	Xã Bàu Năng	1864
460401	Thị trấn Dương Minh Châu	1864
46039	Xã Tân Hưng	1863
46038	Xã Tân Hội	1863
46037	Xã Tân Hòa	1863
46036	Xã Tân Hiệp	1863
46035	Xã Tân Hà	1863
46034	Xã Tân Đông	1863
46033	Xã Suối Ngô	1863
46032	Xã Suối Dây	1863
460312	Xã Thạnh Đông	1863
460311	Xã Tân Thành	1863
460310	Xã Tân Phú	1863
46031	Thị trấn Tân Châu	1863
460210	Xã Trà Vong	1862
460209	Xã Thạnh Tây	1862
460208	Xã Thạnh Bình	1862
460207	Xã Thạnh Bắc	1862
460206	Xã Tân Phong	1862
460205	Xã Tân Lập	1862
460204	Xã Tân Bình	1862
460203	Xã Mỏ Công	1862
460202	Xã Hòa Hiệp	1862
460201	Thị trấn Tân Biên	1862
800302	Phường Long Hoa	1721
460608	Xã Trường Tây	1721
460607	Xã Trường Hòa	1721
460606	Xã Trường Đông	1721
460605	Xã Long Thành Trung	1721
460604	Xã Long Thành Nam	1721
460603	Xã Long Thành Bắc	1721
460602	Xã Hiệp Tân	1721
460601	Thị trấn Hòa Thành	1721
46059	Xã Long Vĩnh	1720
46058	Xã Hòa Thạnh	1720
46057	Xã Hòa Hội	1720
46056	Xã Hảo Đước	1720
46055	Xã Đồng Khởi	1720
46054	Xã Biên Giới	1720
46053	Xã An Cơ	1720
46052	Xã An Bình	1720
460515	Xã Trí Bình	1720
460514	Xã Thành Long	1720
460513	Xã Thanh Điền	1720
460512	Xã Thái Bình	1720
460511	Xã Phước Vinh	1720
460510	Xã Ninh Điền	1720
46051	Thị trấn Châu Thành	1720
460110	Xã Thạnh Tân	1626
460109	Xã Tân Bình	1626
460108	Xã Bình Minh	1626
460107	Phường Ninh Thạnh	1626
460106	Phường Ninh Sơn	1626
460105	Phường Hiệp Ninh	1626
460104	Phường 4	1626
460103	Phường 3	1626
460102	Phường 2	1626
460101	Phường 1	1626
431110	Xã Phước Tân	3444
431109	Xã Phú Trung	3444
431108	Xã Phú Riềng	3444
431107	Xã Long Tân	3444
431106	Xã Long Hưng	3444
431105	Xã Long Hà	3444
431104	Xã Long Bình	3444
431103	Xã Bù Nho	3444
431102	Xã Bình Tân	3444
431101	Xã Bình Sơn	3444
431008	Xã Phước Minh	3141
431007	Xã Phú Văn	3141
431006	Xã Phú Nghĩa	3141
431005	Xã Đức Hạnh	3141
431004	Xã Đăk Ơ	3141
431003	Xã Đa Kia	3141
431002	Xã Bù Gia Mập	3141
431001	Xã Bình Thắng	3141
430607	Xã Thiện Hưng	3140
430606	Xã Thanh Hòa	3140
430605	Xã Tân Tiến	3140
430604	Xã Tân Thành	3140
430603	Xã Phước Thiện	3140
430602	Xã Hưng Phước	3140
430601	Thị trấn Thanh Bình	3140
430516	Xã Lộc Thuận	1964
430515	Xã Lộc Thịnh	1964
430514	Xã Lộc Thiện	1964
430513	Xã Lộc Thạnh	1964
430512	Xã Lộc Thành	1964
430511	Xã Lộc Thái	1964
430510	Xã Lộc Tấn	1964
430509	Xã Lộc Quang	1964
430508	Xã Lộc Phú	1964
430507	Xã Lộc Khánh	1964
430506	Xã Lộc Hưng	1964
430505	Xã Lộc Hòa	1964
430504	Xã Lộc Hiệp	1964
430503	Xã Lộc Điền	1964
430502	Xã Lộc An	1964
430501	Thị trấn Lộc Ninh	1964
430816	Xã Thống Nhất	1899
430815	Xã Thọ Sơn	1899
430814	Xã Phước Sơn	1899
430813	Xã Phú Sơn	1899
430812	Xã Nghĩa Trung	1899
430811	Xã Nghĩa Bình	1899
430810	Xã Minh Hưng	1899
430809	Xã Đường 10	1899
430808	Xã Đức Liễu	1899
430807	Xã Đồng Nai	1899
430806	Xã Đoàn Kết	1899
430805	Xã Đăng Hà	1899
430804	Xã Đak Nhau	1899
430803	Xã Bom Bo	1899
430802	Xã Bình Minh	1899
430801	Thị trấn Đức Phong	1899
430707	Xã Phước Tín	1775
430706	Xã Long Giang	1775
430705	Phường Thác Mơ	1775
430704	Phường Sơn Giang	1775
430703	Phường Phước Bình	1775
430702	Phường Long Thủy	1775
430701	Phường Long Phước	1775
430406	Xã Thanh Phú	1774
430405	Xã Thanh Lương	1774
430404	Phường Phú Thịnh	1774
430403	Phường Phú Đức	1774
430402	Phường Hưng Chiến	1774
430401	Phường An Lộc	1774
430913	Xã Thanh Bình	1773
430912	Xã Thanh An	1773
430911	Xã Tân Quan	1773
430910	Xã Tân Lợi	1773
430909	Xã Tân Khai	1773
430908	Xã Tân Hưng	1773
430907	Xã Tân Hiệp	1773
430906	Xã Phước An	1773
430905	Xã Minh Tâm	1773
430904	Xã Minh Đức	1773
430903	Xã Đồng Nơ	1773
430902	Xã An Phú	1773
430901	Xã An Khương	1773
90837	Phường Hưng Long	1772
430309	Xã Thành Tâm	1772
430308	Xã Quang Minh	1772
430307	Xã Nha Bích	1772
430306	Xã Minh Thành	1772
430305	Xã Minh Thắng	1772
430304	Xã Minh Long	1772
430303	Xã Minh Lập	1772
430302	Xã Minh Hưng	1772
430301	Thị trấn Chơn Thành	1772
430211	Xã Thuận Phú	1722
430210	Xã Thuận Lợi	1722
430209	Xã Tân Tiến	1722
430208	Xã Tân Phước	1722
430207	Xã Tân Lợi	1722
430206	Xã Tân Lập	1722
430205	Xã Tân Hưng	1722
430204	Xã Tân Hòa	1722
430203	Xã Đồng Tiến	1722
430202	Xã Đồng Tâm	1722
430201	Thị trấn Tân Phú	1722
430108	Xã Tiến Thành	1625
430107	Xã Tiến Hưng	1625
430106	Xã Tân Thành	1625
430105	Phường Tân Xuân	1625
430104	Phường Tân Thiện	1625
430103	Phường Tân Phú	1625
430102	Phường Tân Đồng	1625
430101	Phường Tân Bình	1625
91534	Xã Hải Bình	2137
800146	Xã Hải Phong	2137
800145	Xã Hải Hưng	2137
800144	Thị Trấn Diên Sanh	2137
800114	Xã Hải Định	2137
320720	Xã Hải Xuân	2137
320719	Xã Hải Vĩnh	2137
320718	Xã Hải Trường	2137
320717	Xã Hải Thượng	2137
320716	Xã Hải Thọ	2137
320715	Xã Hải Thiện	2137
320714	Xã Hải Thành	2137
320713	Xã Hải Tân	2137
320712	Xã Hải Sơn	2137
320711	Xã Hải Quy	2137
320710	Xã Hải Quế	2137
320709	Xã Hải Phú	2137
320708	Xã Hải Lâm	2137
320707	Xã Hải Khê	2137
320706	Xã Hải Hòa	2137
320705	Xã Hải Dương	2137
320704	Xã Hải Chánh	2137
320703	Xã Hải Ba	2137
320702	Xã Hải An	2137
320701	Thị trấn Hải Lăng	2137
320914	Xã Triệu Nguyên	2105
320913	Xã Tà Rụt	2105
320912	Xã Tà Long	2105
320911	Xã Mò Ó	2105
320910	Xã Hướng Hiệp	2105
320909	Xã Húc Nghì	2105
320908	Xã Hải Phúc	2105
320907	Xã Đa Krông	2105
320906	Xã Ba Nang	2105
320905	Xã Ba Lòng	2105
320904	Xã A Vao	2105
320903	Xã A Ngo	2105
320902	Xã A Bung	2105
320901	Thị trấn Krông Klang	2105
91533	Xã Triệu Cơ	2040
91532	Xã Triệu Tân	2040
320619	Xã Triệu Vân	2040
320618	Xã Triệu Trung	2040
320617	Xã Triệu Trạch	2040
320616	Xã Triệu Thượng	2040
320615	Xã Triệu Thuận	2040
320614	Xã Triệu Thành	2040
320613	Xã Triệu Tài	2040
320612	Xã Triệu Sơn	2040
320611	Xã Triệu Phước	2040
320610	Xã Triệu Long	2040
320609	Xã Triệu Lăng	2040
320608	Xã Triệu Hòa	2040
320607	Xã Triệu Giang	2040
320606	Xã Triệu Đông	2040
320605	Xã Triệu Độ	2040
320604	Xã Triệu Đại	2040
320603	Xã Triệu An	2040
320602	Xã Triệu Ái	2040
320601	Thị Trấn Ái Tử	2040
800112	Xã Phong Bình	1936
800111	Xã Linh Trường	1936
320421	Xã Vĩnh Trường	1936
320420	Xã Trung Sơn	1936
320419	Xã Trung Hải	1936
320418	Xã Trung Giang	1936
320417	Xã Linh Thượng	1936
320416	Xã Linh Hải	1936
320415	Xã Hải Thái	1936
320414	Xã Gio Việt	1936
320413	Xã Gio Thành	1936
320412	Xã Gio Sơn	1936
320411	Xã Gio Quang	1936
320410	Xã Gio Phong	1936
320409	Xã Gio Mỹ	1936
320408	Xã Gio Mai	1936
320407	Xã Gio Hòa	1936
320406	Xã Gio Hải	1936
320405	Xã Gio Châu	1936
320404	Xã Gio Bình	1936
320403	Xã Gio An	1936
320402	Thị trấn Gio Linh	1936
320401	Thị trấn Cửa Việt	1936
800110	Xã Thanh An	1903
320509	Xã Cam Tuyền	1903
320508	Xã Cam Thủy	1903
320507	Xã Cam Thành	1903
320506	Xã Cam Thanh	1903
320505	Xã Cam Nghĩa	1903
320504	Xã Cam Hiếu	1903
320503	Xã Cam Chính	1903
320502	Xã Cam An	1903
320501	Thị trấn Cam Lộ	1903
800117	Xã Trung Nam	1861
800116	Xã Kim Thạch	1861
800115	Xã Hiền Thành	1861
320322	Xã Vĩnh Tú	1861
320321	Xã Vĩnh Trung	1861
320320	Xã Vĩnh Thủy	1861
320319	Xã Vĩnh Thành	1861
320318	Xã Vĩnh Thái	1861
320317	Xã Vĩnh Thạch	1861
320316	Xã Vĩnh Tân	1861
320315	Xã Vĩnh Sơn	1861
320314	Xã Vĩnh Ô	1861
320313	Xã Vĩnh Nam	1861
320312	Xã Vĩnh Long	1861
320311	Xã Vĩnh Lâm	1861
320310	Xã Vĩnh Kim	1861
320309	Xã Vĩnh Khê	1861
320308	Xã Vĩnh Hòa	1861
320307	Xã Vĩnh Hiền	1861
320306	Xã Vĩnh Hà	1861
320305	Xã Vĩnh Giang	1861
320304	Xã Vĩnh Chấp	1861
320303	Thị trấn Hồ Xá	1861
320302	Thị trấn Cửa Tùng	1861
320301	Thị trấn Bến Quan	1861
800113	Xã Lìa	1860
320822	Xã Xy	1860
320821	Xã Thuận	1860
320820	Xã Thanh	1860
320819	Xã Tân Thành	1860
320818	Xã Tân Long	1860
320817	Xã Tân Liên	1860
320816	Xã Tân Lập	1860
320815	Xã Tân Hợp	1860
320814	Xã Hướng Việt	1860
320813	Xã Hướng Tân	1860
320812	Xã Hướng Sơn	1860
320811	Xã Hướng Phùng	1860
320810	Xã Hướng Lộc	1860
320809	Xã Hướng Linh	1860
320808	Xã Hướng Lập	1860
320807	Xã Húc	1860
320806	Xã Ba Tầng	1860
320805	Xã A Xing	1860
320804	Xã A Túc	1860
320803	Xã  A Dơi	1860
320802	Thị trấn Lao Bảo	1860
320801	Thị trấn Khe Sanh	1860
320205	Xã Hải Lệ	1621
320204	Phường An Đôn	1621
320203	Phường 3	1621
320202	Phường 2	1621
320201	Phường 1	1621
320109	Phường Đông Thanh	1620
320108	Phường Đông Lương	1620
320107	Phường Đông Lễ	1620
320106	Phường Đông Giang	1620
320105	Phường 5	1620
320104	Phường 4	1620
320103	Phường 3	1620
320102	Phường 2	1620
320101	Phường 1	1620
310220	Xã Văn Hóa	3286
310219	Xã Tiến Hóa	3286
310218	Xã Thuận Hóa	3286
310217	Xã Thanh Thạch	3286
310216	Xã Thanh Hóa	3286
310215	Xã Thạch Hóa	3286
310214	Xã Sơn Hóa	3286
310213	Xã Phong Hóa	3286
310212	Xã Ngư Hóa	3286
310211	Xã Nam Hóa	3286
310210	Xã Mai Hóa	3286
310209	Xã Lê Hóa	3286
310208	Xã Lâm Hóa	3286
310207	Xã Kim Hóa	3286
310206	Xã Hương Hóa	3286
310205	Xã Đức Hóa	3286
310204	Xã Đồng Hóa	3286
310203	Xã Châu Hóa	3286
310202	Xã Cao Quảng	3286
310201	Thị trấn Đồng Lê	3286
91529	Xã Phù Cảnh	3258
800285	Xã Liên Trường	3258
310418	Xã Quảng Xuân	3258
310417	Xã Quảng Tùng	3258
310416	Xã Quảng Trường	3258
310415	Xã Quảng Tiến	3258
310414	Xã Quảng Thanh	3258
310413	Xã Quảng Thạch	3258
310412	Xã Quảng Phương	3258
310411	Xã Quảng Phú	3258
310410	Xã Quảng Lưu	3258
310409	Xã Quảng Liên	3258
310408	Xã Quảng Kim	3258
310407	Xã Quảng Hưng	3258
310406	Xã Quảng Hợp	3258
310405	Xã Quảng Đông	3258
310404	Xã Quảng Châu	3258
310403	Xã Phù Hóa	3258
310402	Xã Cảnh Hóa	3258
310401	Xã Cảnh Dương	3258
91528	Xã Tân Thành	3224
310316	Xã Yên Hóa	3224
310315	Xã Xuân Hóa	3224
310314	Xã Trung Hóa	3224
310313	Xã Trọng Hóa	3224
310312	Xã Thượng Hóa	3224
310311	Xã Tân Hóa	3224
310310	Xã Quy Hóa	3224
310309	Xã Minh Hóa	3224
310308	Xã Hồng Hóa	3224
310307	Xã Hóa Tiến	3224
310306	Xã Hóa Thanh	3224
310305	Xã Hóa Sơn	3224
310304	Xã Hóa Phúc	3224
310303	Xã Hóa Hợp	3224
310302	Xã Dân Hóa	3224
310301	Thị trấn Quy Đạt	3224
310615	Xã Xuân Ninh	2002
310614	Xã Võ Ninh	2002
310613	Xã Vĩnh Ninh	2002
310612	Xã Vạn Ninh	2002
310611	Xã Trường Xuân	2002
310610	Xã Trường Sơn	2002
310609	Xã Tân Ninh	2002
310608	Xã Lương Ninh	2002
310607	Xã Hiền Ninh	2002
310606	Xã Hàm Ninh	2002
310605	Xã Hải Ninh	2002
310604	Xã Gia Ninh	2002
310603	Xã Duy Ninh	2002
310602	Xã An Ninh	2002
310601	Thị trấn Quán Hàu	2002
310816	Xã Quảng Văn	1859
310815	Xã Quảng Trung	1859
310814	Xã Quảng Tiên	1859
310813	Xã Quảng Thủy	1859
310812	Xã Quảng Tân	1859
310811	Xã Quảng Sơn	1859
310810	Xã Quảng Minh	1859
310809	Xã Quảng Lộc	1859
310808	Xã Quảng Hòa	1859
310807	Xã Quảng Hải	1859
310806	Phường Quảng Thuận	1859
310805	Phường Quảng Thọ	1859
310804	Phường Quảng Phúc	1859
310803	Phường Quảng Phong	1859
310802	Phường Quảng Long	1859
310801	Phường Ba Đồn	1859
91531	Xã Lý Nam	1858
91530	Xã Hạ Mỹ	1858
800287	Thị Trấn Phong Nha	1858
800286	Xã Hải Phú	1858
310530	Xã Xuân Trạch	1858
310529	Xã Vạn Trạch	1858
310528	Xã Trung Trạch	1858
310527	Xã Thượng Trạch	1858
310526	Xã Thanh Trạch	1858
310525	Xã Tây Trạch	1858
310524	Xã Tân Trạch	1858
310523	Xã Sơn Trạch	1858
310522	Xã Sơn Lộc	1858
310521	Xã Phúc Trạch	1858
310520	Xã Phú Trạch	1858
310519	Xã Phú Định	1858
310518	Xã Nhân Trạch	1858
310517	Xã Nam Trạch	1858
310516	Xã Mỹ Trạch	1858
310515	Xã Lý Trạch	1858
310514	Xã Liên Trạch	1858
310513	Xã Lâm Trạch	1858
310512	Xã Hưng Trạch	1858
310511	Xã Hoàn Trạch	1858
310510	Xã Hòa Trạch	1858
310509	Xã Hải Trạch	1858
310508	Xã Hạ Trạch	1858
310507	Xã Đức Trạch	1858
310506	Xã Đồng Trạch	1858
310505	Xã Đại Trạch	1858
310504	Xã Cự Nẫm	1858
310503	Xã Bắc Trạch	1858
310502	Thị trấn NT Việt Trung	1858
310501	Thị trấn Hoàn Lão	1858
800288	Xã Ngư Thủy	1857
310728	Xã Xuân Thủy	1857
310727	Xã Văn Thủy	1857
310726	Xã Trường Thủy	1857
310725	Xã Thanh Thủy	1857
310724	Xã Thái Thủy	1857
310723	Xã Tân Thủy	1857
310722	Xã Sơn Thủy	1857
310721	Xã Sen Thủy	1857
310720	Xã Phú Thủy	1857
310719	Xã Phong Thủy	1857
310718	Xã Ngư Thủy Trung	1857
310717	Xã Ngư Thủy Nam	1857
310716	Xã Ngư Thủy Bắc	1857
310715	Xã Ngân Thủy	1857
310714	Xã Mỹ Thủy	1857
310713	Xã Mai Thủy	1857
310712	Xã Lộc Thủy	1857
310711	Xã Liên Thủy	1857
310710	Xã Lâm Thủy	1857
310709	Xã Kim Thủy	1857
310708	Xã Hưng Thủy	1857
310707	Xã Hồng Thủy	1857
310706	Xã Hoa Thủy	1857
310705	Xã Dương Thủy	1857
310704	Xã Cam Thủy	1857
310703	Xã An Thủy	1857
310702	Thị trấn NT Lệ Ninh	1857
310701	Thị trấn Kiến Giang	1857
800284	Phường Đồng Hải	1619
310116	Xã Thuận Đức	1619
310115	Xã Quang Phú	1619
310114	Xã Nghĩa Ninh	1619
310113	Xã Lộc Ninh	1619
310112	Xã Đức Ninh	1619
310111	Xã Bảo Ninh	1619
310110	Phường Phú Hải	1619
310109	Phường Nam Lý	1619
310108	Phường Hải Thành	1619
310107	Phường Hải Đình	1619
310106	Phường Đức Ninh Đông	1619
310105	Phường Đồng Sơn	1619
310104	Phường Đồng Phú	1619
310103	Phường Đồng Mỹ	1619
310102	Phường Bắc Nghĩa	1619
310101	Phường Bắc Lý	1619
800156	Phường Hưng Trí	3441
301313	Xã Kỳ Anh	3441
301312	Xã Kỳ Ninh	3441
301311	Xã Kỳ Nam	3441
301310	Xã Kỳ Lợi	3441
301309	Xã Kỳ Hưng	3441
301308	Xã Kỳ Hoa	3441
301307	Xã Kỳ Hà	3441
301306	Phường Sông Trí	3441
301305	Phường Kỳ Trinh	3441
301304	Phường Kỳ Thịnh	3441
301303	Phường Kỳ Phương	3441
301302	Phường Kỳ Long	3441
301301	Phường Kỳ Liên	3441
800026	Xã Thọ Điền	3320
800025	Xã Quang Thọ	3320
301112	Xã Sơn Thọ	3320
301111	Xã Hương Thọ	3320
301110	Xã Hương Quang	3320
301109	Xã Hương Minh	3320
301108	Xã Hương Điền	3320
301107	Xã Đức Lĩnh	3320
301106	Xã Đức Liên	3320
301105	Xã Đức Hương	3320
301104	Xã Đức Giang	3320
301103	Xã Đức Bồng	3320
301102	Xã Ân Phú	3320
301101	Thị trấn Vũ Quang	3320
800018	Thị Trấn Lộc Hà	3220
800017	Xã Bình An	3220
301213	Xã Thịnh Lộc	3220
301212	Xã Thạch Mỹ	3220
301211	Xã Thạch Kim	3220
301210	Xã Thạch Châu	3220
301209	Xã Thạch Bằng	3220
301208	Xã Tân Lộc	3220
301207	Xã Phù Lưu	3220
301206	Xã Mai Phụ	3220
301205	Xã Ích Hậu	3220
301204	Xã Hồng Lộc	3220
301203	Xã Hộ Độ	3220
301202	Xã Bình Lộc	3220
301201	Xã An Lộc	3220
91516	Xã Hàm Trường	3201
91515	Xã Mỹ Long	3201
91514	Xã Châu Bình	3201
800015	Xã Tân Mỹ Hà	3201
800014	Xã Quang Diệm	3201
800013	Xã Kim Hoa	3201
800012	Xã An Hòa Thịnh	3201
300332	Xã Sơn Trường	3201
300331	Xã Sơn Trung	3201
300330	Xã Sơn Trà	3201
300329	Xã Sơn Tiến	3201
300328	Xã Sơn Thủy	3201
300327	Xã Sơn Thịnh	3201
300326	Xã Sơn Tây	3201
300325	Xã Sơn Tân	3201
300324	Xã Sơn Quang	3201
300323	Xã Sơn Phúc	3201
300322	Xã Sơn Phú	3201
300321	Xã Sơn Ninh	3201
300320	Xã Sơn Mỹ	3201
300319	Xã Sơn Mai	3201
300318	Xã Sơn Long	3201
300317	Xã Sơn Lĩnh	3201
300316	Xã Sơn Lễ	3201
300315	Xã Sơn Lâm	3201
300314	Xã Sơn Kim 2	3201
300313	Xã Sơn Kim 1	3201
300312	Xã Sơn Hồng	3201
300311	Xã Sơn Hòa	3201
300310	Xã Sơn Hàm	3201
300309	Xã Sơn Hà	3201
300308	Xã Sơn Giang	3201
300307	Xã Sơn Diệm	3201
300306	Xã Sơn Châu	3201
300305	Xã Sơn Bình	3201
300304	Xã Sơn Bằng	3201
300303	Xã Sơn An	3201
300302	Thị trấn Phố Châu	3201
300301	Thị trấn  Tây Sơn	3201
800034	Xã Tùng Châu	3188
800033	Xã Tân Dân	3188
800032	Xã Thanh Bình Thịnh	3188
800031	Xã Quang Vĩnh	3188
800030	Xã Lâm Trung Thủy	3188
800029	Xã Hòa Lạc	3188
800028	Xã Bùi La Nhân	3188
800027	Xã An Dũng	3188
300428	Xã Yên Hồ	3188
300427	Xã Tùng Ảnh	3188
300426	Xã Trường Sơn	3188
300425	Xã Trung Lễ	3188
300424	Xã Thái Yên	3188
300423	Xã Tân Hương	3188
300422	Xã Liên Minh	3188
300421	Xã Đức Yên	3188
300420	Xã Đức Vĩnh	3188
300419	Xã Đức Tùng	3188
300418	Xã Đức Thủy	3188
300417	Xã Đức Thịnh	3188
300416	Xã Đức Thanh	3188
300415	Xã Đức Quang	3188
300414	Xã Đức Nhân	3188
300413	Xã Đức Long	3188
300412	Xã Đức Lập	3188
300411	Xã Đức Lạng	3188
300410	Xã Đức Lâm	3188
300409	Xã Đức Lạc	3188
300408	Xã Đức La	3188
300407	Xã Đức Hòa	3188
300406	Xã Đức Dũng	3188
300405	Xã Đức Đồng	3188
300404	Xã Đức Châu	3188
300403	Xã Đức An	3188
300402	Xã Bùi Xá	3188
300401	Thị trấn Đức Thọ	3188
800008	Xã Kim Song Trường	3143
800007	Xã Khánh Vĩnh Yên	3143
300623	Xã Yên Lộc	3143
300622	Xã Xuân Lộc	3143
300621	Xã Vượng Lộc	3143
300620	Xã Vĩnh Lộc	3143
300619	Xã Tùng Lộc	3143
300618	Xã Trường Lộc	3143
300617	Xã Trung Lộc	3143
300616	Xã Tiến Lộc	3143
300615	Xã Thường Nga	3143
300614	Xã Thượng Lộc	3143
300613	Xã Thuần Thiện	3143
300612	Xã Thiên Lộc	3143
300611	Xã Thanh Lộc	3143
300610	Xã Song Lộc	3143
300609	Xã Sơn Lộc	3143
300608	Xã Quang Lộc	3143
300607	Xã Phú Lộc	3143
300606	Xã Mỹ Lộc	3143
300605	Xã Kim Lộc	3143
300604	Xã Khánh Lộc	3143
300603	Xã Gia Hanh	3143
300602	Xã Đồng Lộc	3143
300601	Thị trấn Nghèn	3143
91630	Xã Bình Lộc	2024
91527	Xã Mai Phụ	2024
91526	Xã Thạch Châu	2024
91525	Xã Thạch Kim	2024
91524	Xã Thạch Mỹ	2024
91523	Thị trấn Lộc Hà	2024
91522	Xã Phù Lưu	2024
91521	Xã Ích Hậu	2024
91520	Xã Bình An	2024
91519	Xã Thịnh Lộc	2024
91518	Xã Hồng Lộc	2024
91517	Xã Tân Lộc	2024
800024	Xã Đỉnh Bàn	2024
800023	Xã Việt Tiến	2024
800022	Xã Tân Lâm Hương	2024
800021	Xã Nam Điền	2024
800020	Xã Lưu Vĩnh Sơn	2024
300831	Xã Việt Xuyên	2024
300830	Xã Tượng Sơn	2024
300829	Xã Thạch Xuân	2024
300828	Xã Thạch Vĩnh	2024
300827	Xã Thạch Văn	2024
300826	Xã Thạch Trị	2024
300825	Xã Thạch Tiến	2024
300824	Xã Thạch Thanh	2024
300823	Xã Thạch Thắng	2024
300822	Xã Thạch Tân	2024
300821	Xã Thạch Sơn	2024
300820	Xã Thạch Ngọc	2024
300819	Xã Thạch Lưu	2024
300818	Xã Thạch Long	2024
300817	Xã Thạch Liên	2024
300816	Xã Thạch Lâm	2024
300815	Xã Thạch Lạc	2024
300814	Xã Thạch Khê	2024
300813	Xã Thạch Kênh	2024
300812	Xã Thạch Hương	2024
300811	Xã Thạch Hội	2024
300810	Xã Thạch Hải	2024
300809	Xã Thạch Đỉnh	2024
300808	Xã Thạch Điền	2024
300807	Xã Thạch Đài	2024
300806	Xã Thạch Bàn	2024
300805	Xã Phù Việt	2024
300804	Xã Ngọc Sơn	2024
300803	Xã Nam Hương	2024
300802	Xã Bắc Sơn	2024
300801	Thị trấn Thạch Hà	2024
800010	Xã Yên Hòa	1815
800009	Xã Nam Phúc Thăng	1815
300927	Xã Cẩm Yên	1815
300926	Xã Cẩm Vịnh	1815
300925	Xã Cẩm Trung	1815
300924	Xã Cẩm Thịnh	1815
300923	Xã Cẩm Thành	1815
300922	Xã Cẩm Thăng	1815
300921	Xã Cẩm Thạch	1815
300920	Xã Cẩm Sơn	1815
300919	Xã Cẩm Quang	1815
300918	Xã Cẩm Quan	1815
300917	Xã Cẩm Phúc	1815
300916	Xã Cẩm Nhượng	1815
300915	Xã Cẩm Nam	1815
300914	Xã Cẩm Mỹ	1815
300913	Xã Cẩm Minh	1815
300912	Xã Cẩm Lộc	1815
300911	Xã Cẩm Lĩnh	1815
300910	Xã Cẩm Lạc	1815
300909	Xã Cẩm Huy	1815
300908	Xã Cẩm Hưng	1815
300907	Xã Cẩm Hòa	1815
300906	Xã Cẩm Hà	1815
300905	Xã Cẩm Dương	1815
300904	Xã Cẩm Duệ	1815
300903	Xã Cẩm Bình	1815
300902	Thị trấn Thiên Cầm	1815
300901	Thị trấn Cẩm Xuyên	1815
300206	Xã Thuận Lộc	1814
300205	Phường Trung Lương	1814
300204	Phường Nam Hồng	1814
300203	Phường Đức Thuận	1814
300202	Phường Đậu Liêu	1814
300201	Phường Bắc Hồng	1814
90774	Thị Trấn Tiên Điền	1813
800019	Xã Đan Trường	1813
300519	Xã Xuân Yên	1813
300518	Xã Xuân Viên	1813
300517	Xã Xuân Trường	1813
300516	Xã Xuân Thành	1813
300515	Xã Xuân Phổ	1813
300514	Xã Xuân Mỹ	1813
300513	Xã Xuân Lĩnh	1813
300512	Xã Xuân Liên	1813
300511	Xã Xuân Lam	1813
300510	Xã Xuân Hồng	1813
300509	Xã Xuân Hội	1813
300508	Xã Xuân Hải	1813
300507	Xã Xuân Giang	1813
300506	Xã Xuân Đan	1813
300505	Xã Tiên Điền	1813
300504	Xã Cương Gián	1813
300503	Xã Cổ Đạm	1813
300502	Thị trấn Xuân An	1813
300501	Thị trấn Nghi Xuân	1813
800011	Xã Điền Mỹ	1812
300722	Xã Phương Mỹ	1812
300721	Xã Phương Điền	1812
300720	Xã Phúc Trạch	1812
300719	Xã Phúc Đồng	1812
300718	Xã Phú Phong	1812
300717	Xã Phú Gia	1812
300716	Xã Lộc Yên	1812
300715	Xã Hương Xuân	1812
300714	Xã Hương Vĩnh	1812
300713	Xã Hương Trạch	1812
300712	Xã Hương Trà	1812
300711	Xã Hương Thủy	1812
300710	Xã Hương Long	1812
300709	Xã Hương Liên	1812
300708	Xã Hương Lâm	1812
300707	Xã Hương Giang	1812
300706	Xã Hương Đô	1812
300705	Xã Hương Bình	1812
300704	Xã Hòa Hải	1812
300703	Xã Hà Linh	1812
300702	Xã Gia Phố	1812
300701	Thị trấn Hương Khê	1812
800016	Xã Lâm Hợp	1811
301021	Xã Kỳ Xuân	1811
301020	Xã Kỳ Văn	1811
301019	Xã Kỳ Trung	1811
301018	Xã Kỳ Tiến	1811
301017	Xã Kỳ Thượng	1811
301016	Xã Kỳ Thư	1811
301015	Xã Kỳ Thọ	1811
301014	Xã Kỳ Tây	1811
301013	Xã Kỳ Tân	1811
301012	Xã Kỳ Sơn	1811
301011	Xã Kỳ Phú	1811
301010	Xã Kỳ Phong	1811
301009	Xã Kỳ Lâm	1811
301008	Xã Kỳ Lạc	1811
301007	Xã Kỳ Khang	1811
301006	Xã Kỳ Hợp	1811
301005	Xã Kỳ Hải	1811
301004	Xã Kỳ Giang	1811
301003	Xã Kỳ Đồng	1811
301002	Xã Kỳ Châu	1811
301001	Xã Kỳ Bắc	1811
91513	Xã Cẩm Vịnh	1618
91512	Xã Cẩm Bình	1618
91511	Xã Tân Lâm Hương	1618
91510	Xã Thạch Hội	1618
91509	Xã Thạch Đài	1618
91508	Xã Thạch Thắng	1618
91507	Xã Thạch Văn	1618
91506	Xã Tượng Sơn	1618
91505	Xã Thạch Lạc	1618
91504	Xã Thạch Trị	1618
91503	Xã Thạch Khê	1618
91502	Xã Hộ Độ	1618
91501	Xã Đỉnh Bàn	1618
91500	Xã Thạch Hải	1618
800172	Xã Đồng Môn	1618
300116	Xã Thạch Trung	1618
300115	Xã Thạch Môn	1618
300114	Xã Thạch Hưng	1618
300113	Xã Thạch Hạ	1618
300112	Xã Thạch Đồng	1618
300111	Xã Thạch Bình	1618
300110	Phường Văn Yên	1618
300109	Phường Trần Phú	1618
300108	Phường Thạch Quý	1618
300107	Phường Thạch Linh	1618
300106	Phường Tân Giang	1618
300105	Phường Nguyễn Du	1618
300104	Phường Nam Hà	1618
300103	Phường Hà Huy Tập	1618
300102	Phường Đại Nài	1618
300101	Phường Bắc Hà	1618
91493	Xã Mai Giang	3291
91492	Xã Kim Bảng	3291
91491	Xã Minh Tiến	3291
91490	Xã Xuân Dương	3291
91489	Xã Thanh Quả	3291
91488	Xã Minh Sơn	3291
91487	Thị trấn Dùng	3291
800093	Xã Đại Đồng	3291
291540	Xã Xuân Tường	3291
291539	Xã Võ Liệt	3291
291538	Xã Thanh Yên	3291
291537	Xã Thanh Xuân	3291
291536	Xã Thanh Văn	3291
291535	Xã Thanh Tường	3291
291534	Xã Thanh Tùng	3291
291533	Xã Thanh Tiên	3291
291532	Xã Thanh Thủy	3291
291531	Xã Thanh Thịnh	3291
291530	Xã Thanh Sơn	3291
291529	Xã Thanh Phong	3291
291528	Xã Thanh Nho	3291
291527	Xã Thanh Ngọc	3291
291526	Xã Thanh Mỹ	3291
291525	Xã Thanh Mai	3291
291524	Xã Thanh Lương	3291
291523	Xã Thanh Long	3291
291522	Xã Thanh Lĩnh	3291
291521	Xã Thanh Liên	3291
291520	Xã Thanh Lâm	3291
291519	Xã Thanh Khê	3291
291518	Xã Thanh Khai	3291
291517	Xã Thanh Hương	3291
291516	Xã Thanh Hưng	3291
291515	Xã Thanh Hòa	3291
291514	Xã Thanh Hà	3291
291513	Xã Thanh Giang	3291
291512	Xã Thanh Dương	3291
291511	Xã Thanh Đức	3291
291510	Xã Thanh Đồng	3291
291509	Xã Thanh Chi	3291
291508	Xã Thanh An	3291
291507	Xã Phong Thịnh	3291
291506	Xã Ngọc Sơn	3291
291505	Xã Ngọc Lâm	3291
291504	Xã Hạnh Lâm	3291
291503	Xã Đồng Văn	3291
291502	Xã Cát Văn	3291
291501	Thị trấn Thanh Chương	3291
90779	Thị trấn Thạch Giám	3288
290818	Xã Yên Tĩnh	3288
290817	Xã Yên Thắng	3288
290816	Xã Yên Na	3288
290815	Xã Yên Hòa	3288
290814	Xã Xiêng My	3288
290813	Xã Xá Lượng	3288
290812	Xã Thạch Giám	3288
290811	Xã Tam Thái	3288
290810	Xã Tam Quang	3288
290809	Xã Tam Hợp	3288
290808	Xã Tam Đình	3288
290807	Xã Nhôn Mai	3288
290806	Xã Nga My	3288
290805	Xã Mai Sơn	3288
290804	Xã Lưu Kiền	3288
290803	Xã Lưỡng Minh	3288
290802	Xã Hữu Khuông	3288
290801	Thị trấn Hòa Bình	3288
290312	Xã Diên Lãm	3261
290311	Xã Châu Tiến	3261
290310	Xã Châu Thuận	3261
290309	Xã Châu Thắng	3261
290308	Xã Châu Phong	3261
290307	Xã Châu Nga	3261
290306	Xã Châu Hội	3261
290305	Xã Châu Hoàn	3261
290304	Xã Châu Hạnh	3261
290303	Xã Châu Bình	3261
290302	Xã Châu Bính	3261
290301	Thị trấn Tân Lạc	3261
291914	Xã Tri Lễ	3260
291913	Xã Tiền Phong	3260
291912	Xã Thông Thụ	3260
291911	Xã Quế Sơn	3260
291910	Xã Quang Phong	3260
291909	Xã Nậm Nhoóng	3260
291908	Xã Nậm Giải	3260
291907	Xã Mường Nọc	3260
291906	Xã Hạnh Dịch	3260
291905	Xã Đồng Văn	3260
291904	Xã Châu Thôn	3260
291903	Xã Châu Kim	3260
291902	Xã Căm Muộn	3260
291901	Thị trấn Kim Sơn	3260
91497	Xã Xuân Hồng	3233
91496	Xã Nghĩa Thái	3233
800091	Xã Trung Phúc Cường	3233
800090	Xã Thượng Tân Lộc	3233
291724	Xã Xuân Lâm	3233
291723	Xã Xuân Hòa	3233
291722	Xã Vân Diên	3233
291721	Xã Nam Xuân	3233
291720	Xã Nam Trung	3233
291719	Xã Nam Thượng	3233
291718	Xã Nam Thanh	3233
291717	Xã Nam Thái	3233
291716	Xã Nam Tân	3233
291715	Xã Nam Phúc	3233
291714	Xã Nam Nghĩa	3233
291713	Xã Nam Lộc	3233
291712	Xã Nam Lĩnh	3233
291711	Xã Nam Kim	3233
291710	Xã Nam Hưng	3233
291709	Xã Nam Giang	3233
291708	Xã Nam Cường	3233
291707	Xã Nam Cát	3233
291706	Xã Nam Anh	3233
291705	Xã Kim Liên	3233
291704	Xã Khánh Sơn	3233
291703	Xã Hùng Tiến	3233
291702	Xã Hồng Long	3233
291701	Thị trấn Nam Đàn	3233
29079	Xã Hữu Lập	3211
29078	Xã Hữu Kiệm	3211
29077	Xã Huồi Tụ	3211
29076	Xã Đoọc Mạy	3211
29075	Xã Chiêu Lưu	3211
29074	Xã Bảo Thắng	3211
29073	Xã Bảo Nam	3211
290721	Xã Tây Sơn	3211
290720	Xã Tà Cạ	3211
29072	Xã Bắc Lý	3211
290719	Xã Phà Đánh	3211
290718	Xã Nậm Cắn	3211
290717	Xã Nậm Càn	3211
290716	Xã Na Ngoi	3211
290715	Xã Na Loi	3211
290714	Xã Mỹ Lý	3211
290713	Xã Mường Típ	3211
290712	Xã Mường Lống	3211
290711	Xã Mường Ải	3211
290710	Xã Keng Đu	3211
29071	Thị trấn Mường Xén	3211
91499	Xã Phúc Lợi	1947
91498	Xã Thịnh Mỹ	1947
90839	Xã Thông Tân	1947
800089	Xã Xuân Lam	1947
800088	Xã Long Xá	1947
800087	Xã Hưng Thành	1947
800086	Xã Hưng Nghĩa	1947
800085	Xã Châu Nhân	1947
291823	Xã Hưng Yên Bắc	1947
291822	Xã Hưng Yên	1947
291821	Xã Hưng Xuân	1947
291820	Xã Hưng Xá	1947
291819	Xã Hưng Trung	1947
291818	Xã Hưng Tiến	1947
291817	Xã Hưng Thông	1947
291816	Xã Hưng Thịnh	1947
291815	Xã Hưng Thắng	1947
291814	Xã Hưng Tây	1947
291813	Xã Hưng Tân	1947
291812	Xã Hưng Phúc	1947
291811	Xã Hưng Phú	1947
291810	Xã Hưng Nhân	1947
291809	Xã Hưng Mỹ	1947
291808	Xã Hưng Long	1947
291807	Xã Hưng Lợi	1947
291806	Xã Hưng Lĩnh	1947
291805	Xã Hưng Lam	1947
291804	Xã Hưng Khánh	1947
291803	Xã Hưng Đạo	1947
291802	Xã Hưng Châu	1947
291801	Thị trấn Hưng Nguyên	1947
91495	Xã Diên Hoa	1854
91494	Xã Thịnh Trường	1854
800143	Xã Khánh Hợp	1854
291630	Xã Phúc Thọ	1854
291629	Xã Nghi Yên	1854
291628	Xã Nghi Xuân	1854
291627	Xã Nghi Xá	1854
291626	Xã Nghi Vạn	1854
291625	Xã Nghi Văn	1854
291624	Xã Nghi Trường	1854
291623	Xã Nghi Trung	1854
291622	Xã Nghi Tiến	1854
291621	Xã Nghi Thuận	1854
291620	Xã Nghi Thịnh	1854
291619	Xã Nghi Thiết	1854
291618	Xã Nghi Thái	1854
291617	Xã Nghi Thạch	1854
291616	Xã Nghi Quang	1854
291615	Xã Nghi Phương	1854
291614	Xã Nghi Phong	1854
291613	Xã Nghi Mỹ	1854
291612	Xã Nghi Long	1854
291611	Xã Nghi Lâm	1854
291610	Xã Nghi Kiều	1854
291609	Xã Nghi Khánh	1854
291608	Xã Nghi Hưng	1854
291607	Xã Nghi Hợp	1854
291606	Xã Nghi Hoa	1854
291605	Xã Nghi Đồng	1854
291604	Xã Nghi Diên	1854
291603	Xã Nghi Công Nam	1854
291602	Xã Nghi Công Bắc	1854
291601	Thị trấn Quán Hành	1854
91477	Thị trấn Trà Lân	1853
290913	Xã Yên Khê	1853
290912	Xã Thạch Ngàn	1853
290911	Xã Môn Sơn	1853
290910	Xã Mậu Đức	1853
290909	Xã Lục Dạ	1853
290908	Xã Lạng Khê	1853
290907	Xã Đôn Phục	1853
290906	Xã Chi Khê	1853
290905	Xã Châu Khê	1853
290904	Xã Cam Lâm	1853
290903	Xã Bồng Khê	1853
290902	Xã Bình Chuẩn	1853
290901	Thị trấn Con Cuông	1853
290421	Xã Yên Hợp	1852
290420	Xã Văn Lợi	1852
290419	Xã Thọ Hợp	1852
290418	Xã Tam Hợp	1852
290417	Xã Nghĩa Xuân	1852
290416	Xã Nam Sơn	1852
290415	Xã Minh Hợp	1852
290414	Xã Liên Hợp	1852
290413	Xã Hạ Sơn	1852
290412	Xã Đồng Hợp	1852
290411	Xã Châu Tiến	1852
290410	Xã Châu Thành	1852
290409	Xã Châu Thái	1852
290408	Xã Châu Quang	1852
290407	Xã Châu Lý	1852
290406	Xã Châu Lộc	1852
290405	Xã Châu Hồng	1852
290404	Xã Châu Đình	1852
290403	Xã Châu Cường	1852
290402	Xã Bắc Sơn	1852
290401	Thị trấn Quỳ Hợp	1852
800092	Xã Nghĩa Thành	1851
290525	Xã Nghĩa Yên	1851
290524	Xã Nghĩa Trung	1851
290523	Xã Nghĩa Thọ	1851
290522	Xã Nghĩa Thịnh	1851
290521	Xã Nghĩa Thắng	1851
290520	Xã Nghĩa Tân	1851
290519	Xã Nghĩa Sơn	1851
290518	Xã Nghĩa Phú	1851
290517	Xã Nghĩa Minh	1851
290516	Xã Nghĩa Mai	1851
290515	Xã Nghĩa Long	1851
290514	Xã Nghĩa Lợi	1851
290513	Xã Nghĩa Lộc	1851
290512	Xã Nghĩa Liên	1851
290511	Xã Nghĩa Lâm	1851
290510	Xã Nghĩa Lạc	1851
290509	Xã Nghĩa Khánh	1851
290508	Xã Nghĩa Hưng	1851
290507	Xã Nghĩa Hồng	1851
290506	Xã Nghĩa Hội	1851
290505	Xã Nghĩa Hiếu	1851
290504	Xã Nghĩa Đức	1851
290503	Xã Nghĩa Bình	1851
290502	Xã Nghĩa An	1851
290501	Thị trấn Nghĩa Đàn	1851
292010	Xã Tây Hiếu	1850
292009	Xã Nghĩa Tiến	1850
292008	Xã Nghĩa Thuận	1850
292007	Xã Nghĩa Mỹ	1850
292006	Xã Nghĩa Hòa	1850
292005	Xã Đông Hiếu	1850
292004	Phường Quang Tiến	1850
292003	Phường Quang Phong	1850
292002	Phường Long Sơn	1850
292001	Phường Hoà Hiếu	1850
292110	Xã Quỳnh Vinh	1849
292109	Xã Quỳnh Trang	1849
292108	Xã Quỳnh Lộc	1849
292107	Xã Quỳnh Liên	1849
292106	Xã Quỳnh Lập	1849
292105	Phường Quỳnh Xuân	1849
292104	Phường Quỳnh Thiện	1849
292103	Phường Quỳnh Phương	1849
292102	Phường Quỳnh Dị	1849
292101	Phường Mai Hùng	1849
91476	Xã Thuận Long	1848
91475	Xã Văn Hải	1848
91474	Xã Phú Nghĩa	1848
91473	Xã Bình Sơn	1848
91472	Xã Minh Lương	1848
91471	Xã Quỳnh Sơn	1848
290633	Xã Tiến Thủy	1848
290632	Xã Tân Thắng	1848
290631	Xã Tân Sơn	1848
290630	Xã Sơn Hải	1848
290629	Xã Quỳnh Yên	1848
290628	Xã Quỳnh Văn	1848
290627	Xã Quỳnh Thuận	1848
290626	Xã Quỳnh Thọ	1848
290625	Xã Quỳnh Thanh	1848
290624	Xã Quỳnh Thắng	1848
290623	Xã Quỳnh Thạch	1848
290622	Xã Quỳnh Tân	1848
290621	Xã Quỳnh Tam	1848
290620	Xã Quỳnh Ngọc	1848
290619	Xã Quỳnh Nghĩa	1848
290618	Xã Quỳnh Mỹ	1848
290617	Xã Quỳnh Minh	1848
290616	Xã Quỳnh Lương	1848
290615	Xã Quỳnh Long	1848
290614	Xã Quỳnh Lâm	1848
290613	Xã Quỳnh Hưng	1848
290612	Xã Quỳnh Hồng	1848
290611	Xã Quỳnh Hoa	1848
290610	Xã Quỳnh Hậu	1848
290609	Xã Quỳnh Giang	1848
290608	Xã Quỳnh Đôi	1848
290607	Xã Quỳnh Diễn	1848
290606	Xã Quỳnh Châu	1848
290605	Xã Quỳnh Bảng	1848
290604	Xã Quỳnh Bá	1848
290603	Xã Ngọc Sơn	1848
290602	Xã An Hòa	1848
290601	Thị trấn Cầu Giát	1848
91485	Xã Ngọc Bích	1847
91484	Xã Hạnh Quảng	1847
91483	Xã Xuân Tháp	1847
91482	Xã Hùng Hải	1847
800084	Xã Minh Châu	1847
291239	Xã Diễn Yên	1847
291238	Xã Diễn Xuân	1847
291237	Xã Diễn Vạn	1847
291236	Xã Diễn Trường	1847
291235	Xã Diễn Trung	1847
291234	Xã Diễn Thọ	1847
291233	Xã Diễn Thịnh	1847
291232	Xã Diễn Tháp	1847
291231	Xã Diễn Thành	1847
291230	Xã Diễn Thắng	1847
291229	Xã Diễn Thái	1847
291228	Xã Diễn Tân	1847
291227	Xã Diễn Quảng	1847
291226	Xã Diễn Phúc	1847
291225	Xã Diễn Phú	1847
291224	Xã Diễn Phong	1847
291223	Xã Diễn Nguyên	1847
291222	Xã Diễn Ngọc	1847
291221	Xã Diễn Mỹ	1847
291220	Xã Diễn Minh	1847
291219	Xã Diễn Lợi	1847
291218	Xã Diễn Lộc	1847
291217	Xã Diễn Liên	1847
291216	Xã Diễn Lâm	1847
291215	Xã Diễn Kỷ	1847
291214	Xã Diễn Kim	1847
291213	Xã Diễn Hùng	1847
291212	Xã Diễn Hồng	1847
291211	Xã Diễn Hoàng	1847
291210	Xã Diễn Hoa	1847
291209	Xã Diễn Hạnh	1847
291208	Xã Diễn Hải	1847
291207	Xã Diễn Đồng	1847
291206	Xã Diễn Đoài	1847
291205	Xã Diễn Cát	1847
291204	Xã Diễn Bình	1847
291203	Xã Diễn Bích	1847
291202	Xã Diễn An	1847
291201	Thị trấn Diễn Châu	1847
90842	Xã Vân Tụ	1846
291139	Xã Xuân Thành	1846
291138	Xã Vĩnh Thành	1846
291137	Xã Viên Thành	1846
291136	Xã Văn Thành	1846
291135	Xã Trung Thành	1846
291134	Xã Tiến Thành	1846
291133	Xã Thọ Thành	1846
291132	Xã Thịnh Thành	1846
291131	Xã Tây Thành	1846
291130	Xã Tăng Thành	1846
291129	Xã Tân Thành	1846
291128	Xã Sơn Thành	1846
291127	Xã Quang Thành	1846
291126	Xã Phúc Thành	1846
291125	Xã Phú Thành	1846
291124	Xã Nhân Thành	1846
291123	Xã Nam Thành	1846
291122	Xã Mỹ Thành	1846
291121	Xã Minh Thành	1846
291120	Xã Mã Thành	1846
291119	Xã Lý Thành	1846
291118	Xã Long Thành	1846
291117	Xã Liên Thành	1846
291116	Xã Lăng Thành	1846
291115	Xã Kim Thành	1846
291114	Xã Khánh Thành	1846
291113	Xã Hùng Thành	1846
291112	Xã Hợp Thành	1846
291111	Xã Hồng Thành	1846
291110	Xã Hoa Thành	1846
291109	Xã Hậu Thành	1846
291108	Xã Đức Thành	1846
291107	Xã Đồng Thành	1846
291106	Xã Đô Thành	1846
291105	Xã Đại Thành	1846
291104	Xã Công Thành	1846
291103	Xã Bảo Thành	1846
291102	Xã Bắc Thành	1846
291101	Thị trấn Yên Thành	1846
91479	Xã Hoàn Long	1845
91478	Xã Bình Hợp	1845
291022	Xã Tiên Kỳ	1845
291021	Xã Tân Xuân	1845
291020	Xã Tân Phú	1845
291019	Xã Tân Long	1845
291018	Xã Tân Hương	1845
291017	Xã Tân Hợp	1845
291016	Xã Tân An	1845
291015	Xã Phú Sơn	1845
291014	Xã Nghĩa Thái	1845
291013	Xã Nghĩa Phúc	1845
291012	Xã Nghĩa Hợp	1845
291011	Xã Nghĩa Hoàn	1845
291010	Xã Nghĩa Hành	1845
291009	Xã Nghĩa Dũng	1845
291008	Xã Nghĩa Đồng	1845
291007	Xã Nghĩa Bình	1845
291006	Xã Kỳ Tân	1845
291005	Xã Kỳ Sơn	1845
291004	Xã Hương Sơn	1845
291003	Xã Giai Xuân	1845
291002	Xã Đồng Văn	1845
291001	Thị trấn Tân Kỳ	1845
91481	Xã Tam Đỉnh	1844
91480	Thị trấn Kim Nhan	1844
291321	Xã Vĩnh Sơn	1844
291320	Xã Tường Sơn	1844
291319	Xã Thọ Sơn	1844
291318	Xã Thành Sơn	1844
291317	Xã Thạch Sơn	1844
291316	Xã Tào Sơn	1844
291315	Xã Tam Sơn	1844
291314	Xã Phúc Sơn	1844
291313	Xã Long Sơn	1844
291312	Xã Lĩnh Sơn	1844
291311	Xã Lạng Sơn	1844
291310	Xã Khai Sơn	1844
291309	Xã Hùng Sơn	1844
291308	Xã Hội Sơn	1844
291307	Xã Hoa Sơn	1844
291306	Xã Đức Sơn	1844
291305	Xã Đỉnh Sơn	1844
291304	Xã Cao Sơn	1844
291303	Xã Cẩm Sơn	1844
291302	Xã Bình Sơn	1844
291301	Thị trấn Anh Sơn	1844
91486	Xã Bạch Ngọc	1843
291433	Xã Yên Sơn	1843
291432	Xã Xuân Sơn	1843
291431	Xã Văn Sơn	1843
291430	Xã Trung Sơn	1843
291429	Xã Trù Sơn	1843
291428	Xã Tràng Sơn	1843
291427	Xã Thượng Sơn	1843
291426	Xã Thuận Sơn	1843
291425	Xã Thịnh Sơn	1843
291424	Xã Thái Sơn	1843
291423	Xã Tân Sơn	1843
291422	Xã Quang Sơn	1843
291421	Xã Nhân Sơn	1843
291420	Xã Ngọc Sơn	1843
291419	Xã Nam Sơn	1843
291418	Xã Mỹ Sơn	1843
291417	Xã Minh Sơn	1843
291416	Xã Lưu Sơn	1843
291415	Xã Lam Sơn	1843
291414	Xã Lạc Sơn	1843
291413	Xã Hồng Sơn	1843
291412	Xã Hòa Sơn	1843
291411	Xã Hiến Sơn	1843
291410	Xã Giang Sơn Tây	1843
291409	Xã Giang Sơn Đông	1843
291408	Xã Đông Sơn	1843
291407	Xã Đặng Sơn	1843
291406	Xã Đại Sơn	1843
291405	Xã Đà Sơn	1843
291404	Xã Bồi Sơn	1843
291403	Xã Bài Sơn	1843
291402	Xã Bắc Sơn	1843
291401	Thị trấn Đô Lương	1843
290207	Phường Thu Thuỷ	1842
290206	Phường Nghi Thuỷ	1842
290205	Phường Nghi Thu	1842
290204	Phường Nghi Tân	1842
290203	Phường Nghi Hương	1842
290202	Phường Nghi Hòa	1842
290201	Phường Nghi Hải	1842
91470	Xã Nghi Thái	1617
91469	Xã Phúc Thọ	1617
91468	Xã Nghi Xuân	1617
91467	Xã Nghi Phong	1617
91466	Phường Nghi Thu	1617
91465	Phường Nghi Hương	1617
91464	Phường Nghi Hải	1617
91463	Phường Nghi Hòa	1617
91462	Phường Thu Thuỷ	1617
91461	Phường Nghi Tân	1617
91460	Phường Nghi Thuỷ	1617
290125	Xã Nghi Phú	1617
290124	Xã Nghi Liên	1617
290123	Xã Nghi Kim	1617
290122	Xã Nghi Đức	1617
290121	Xã Nghi Ân	1617
290120	Xã Hưng Lộc	1617
290119	Xã Hưng Hòa	1617
290118	Xã Hưng Đông	1617
290117	Xã Hưng Chính	1617
290116	Phường Vinh Tân	1617
290115	Phường Trường Thi	1617
290114	Phường Trung Đô	1617
290113	Phường Quang Trung	1617
290112	Phường Quán Bàu	1617
290111	Phường Lê Mao	1617
290110	Phường Lê Lợi	1617
290109	Phường Hưng Phúc	1617
290108	Phường Hưng Dũng	1617
290107	Phường Hưng Bình	1617
290106	Phường Hồng Sơn	1617
290105	Phường Hà Huy Tập	1617
290104	Phường Đông Vĩnh	1617
290103	Phường Đội Cung	1617
290102	Phường Cửa Nam	1617
290101	Phường Bến Thủy	1617
91458	Thị trấn Hậu Hiền	3298
800151	Thị Trấn Thiệu Hóa	3298
800126	Xã Tân Châu	3298
800125	Xã Minh Tâm	3298
281728	Xã Thiệu Vũ	3298
281727	Xã Thiệu Viên	3298
281726	Xã Thiệu Vận	3298
281725	Xã Thiệu Trung	3298
281724	Xã Thiệu Toán	3298
281723	Xã Thiệu Tiến	3298
281722	Xã Thiệu Thịnh	3298
281721	Xã Thiệu Thành	3298
281720	Xã Thiệu Tân	3298
281719	Xã Thiệu Tâm	3298
281718	Xã Thiệu Quang	3298
281717	Xã Thiệu Phúc	3298
281716	Xã Thiệu Phú	3298
281715	Xã Thiệu Nguyên	3298
281714	Xã Thiệu Ngọc	3298
281713	Xã Thiệu Minh	3298
281712	Xã Thiệu Lý	3298
281711	Xã Thiệu Long	3298
281710	Xã Thiệu Hợp	3298
281709	Xã Thiệu Hòa	3298
281708	Xã Thiệu Giao	3298
281707	Xã Thiệu Giang	3298
281706	Xã Thiệu Duy	3298
281705	Xã Thiệu Đô	3298
281704	Xã Thiệu Công	3298
281703	Xã Thiệu Chính	3298
281702	Xã Thiệu Châu	3298
281701	Thị trấn Vạn Hà	3298
91459	Xã Nga Hiệp	3241
800123	Xã Nga Phượng	3241
282327	Xã Nga Yên	3241
282326	Xã Nga Vịnh	3241
282325	Xã Nga Văn	3241
282324	Xã Nga Trường	3241
282323	Xã Nga Trung	3241
282322	Xã Nga Tiến	3241
282321	Xã Nga Thủy	3241
282320	Xã Nga Thiện	3241
282319	Xã Nga Thành	3241
282318	Xã Nga Thanh	3241
282317	Xã Nga Thắng	3241
282316	Xã Nga Thái	3241
282315	Xã Nga Thạch	3241
282314	Xã Nga Tân	3241
282313	Xã Nga Phú	3241
282312	Xã Nga Nhân	3241
282311	Xã Nga Mỹ	3241
282310	Xã Nga Lĩnh	3241
282309	Xã Nga Liên	3241
282308	Xã Nga Hưng	3241
282307	Xã Nga Hải	3241
282306	Xã Nga Giáp	3241
282305	Xã Nga Điền	3241
282304	Xã Nga Bạch	3241
282303	Xã Nga An	3241
282302	Xã Ba Đình	3241
282301	Thị trấn Nga Sơn	3241
281111	Xã Yên Thắng	3216
281110	Xã Yên Khương	3216
281109	Xã Trí Nang	3216
281108	Xã Tân Phúc	3216
281107	Xã Tam Văn	3216
281106	Xã Quang Hiến	3216
281105	Xã Lâm Phú	3216
281104	Xã Giao Thiện	3216
281103	Xã Giao An	3216
281102	Xã Đồng Lương	3216
281101	Thị trấn Lang Chánh	3216
800147	Thị Trấn Phong Sơn	3147
281420	Xã Phúc Do	3147
281419	Xã Cẩm Yên	3147
281418	Xã Cẩm Vân	3147
281417	Xã Cẩm Tú	3147
281416	Xã Cẩm Thành	3147
281415	Xã Cẩm Thạch	3147
281414	Xã Cẩm Tân	3147
281413	Xã Cẩm Tâm	3147
281412	Xã Cẩm Sơn	3147
281411	Xã Cẩm Quý	3147
281410	Xã Cẩm Phú	3147
281409	Xã Cẩm Phong	3147
281408	Xã Cẩm Ngọc	3147
281407	Xã Cẩm Lương	3147
281406	Xã Cẩm Long	3147
281405	Xã Cẩm Liên	3147
281404	Xã Cẩm Giang	3147
281403	Xã Cẩm Châu	3147
281402	Xã Cẩm Bình	3147
281401	Thị trấn Cẩm Thủy	3147
800132	Thị Trấn Nưa	2249
281836	Xã Xuân Thọ	2249
281835	Xã Xuân Thịnh	2249
281834	Xã Xuân Lộc	2249
281833	Xã Vân Sơn	2249
281832	Xã Triệu Thành	2249
281831	Xã Tiến Nông	2249
281830	Xã Thọ Vực	2249
281829	Xã Thọ Tiến	2249
281828	Xã Thọ Thế	2249
281827	Xã Thọ Tân	2249
281826	Xã Thọ Sơn	2249
281825	Xã Thọ Phú	2249
281824	Xã Thọ Ngọc	2249
281823	Xã Thọ Dân	2249
281822	Xã Thọ Cường	2249
281821	Xã Thọ Bình	2249
281820	Xã Thái Hòa	2249
281819	Xã Tân Ninh	2249
281818	Xã Nông Trường	2249
281817	Xã Minh Sơn	2249
281816	Xã Minh Dân	2249
281815	Xã Minh Châu	2249
281814	Xã Khuyến Nông	2249
281813	Xã Hợp Tiến	2249
281812	Xã Hợp Thành	2249
281811	Xã Hợp Thắng	2249
281810	Xã Hợp Lý	2249
281809	Xã Đồng Tiến	2249
281808	Xã Đồng Thắng	2249
281807	Xã Đồng Lợi	2249
281806	Xã Dân Quyền	2249
281805	Xã Dân Lý	2249
281804	Xã Dân Lực	2249
281803	Xã Bình Sơn	2249
281802	Xã An Nông	2249
281801	Thị trấn Triệu Sơn	2249
281017	Xã Yên Thọ	2190
281016	Xã Yên Lạc	2190
281015	Xã Xuân Thọ	2190
281014	Xã Xuân Thái	2190
281013	Xã Xuân Phúc	2190
281012	Xã Xuân Khang	2190
281011	Xã Xuân Du	2190
281010	Xã Thanh Tân	2190
281009	Xã Thanh Kỳ	2190
281008	Xã Phượng Nghi	2190
281007	Xã Phúc Đường	2190
281006	Xã Phú Nhuận	2190
281005	Xã Mậu Lâm	2190
281004	Xã Hải Vân	2190
281003	Xã Hải Long	2190
281002	Xã Cán Khê	2190
281001	Thị trấn Bến Sung	2190
281932	Xã Yên Mỹ	2181
281931	Xã Vạn Thiện	2181
281930	Xã Vạn Thắng	2181
281929	Xã Vạn Hòa	2181
281928	Xã Tượng Văn	2181
281927	Xã Tượng Sơn	2181
281926	Xã Tượng Lĩnh	2181
281925	Xã Trường Trung	2181
281924	Xã Trường Sơn	2181
281923	Xã Trường Minh	2181
281922	Xã Trường Giang	2181
281921	Xã Trung Ý	2181
281920	Xã Trung Thành	2181
281919	Xã Trung Chính	2181
281918	Xã Thăng Thọ	2181
281917	Xã Thăng Long	2181
281916	Xã Thăng Bình	2181
281915	Xã Tế Thắng	2181
281914	Xã Tế Tân	2181
281913	Xã Tế Nông	2181
281912	Xã Tế Lợi	2181
281911	Xã Tân Thọ	2181
281910	Xã Tân Phúc	2181
281909	Xã Tân Khang	2181
281908	Xã Minh Nghĩa	2181
281907	Xã Minh Khôi	2181
281906	Xã Hoàng Sơn	2181
281905	Xã Hoàng Giang	2181
281904	Xã Công Liêm	2181
281903	Xã Công Chính	2181
281902	Xã Công Bình	2181
281901	Thị trấn Nông Cống	2181
280723	Xã Văn Nho	2070
280722	Xã Thiết Ống	2070
280721	Xã Thiết Kế	2070
280720	Xã Thành Sơn	2070
280719	Xã Thành Lâm	2070
280718	Xã Tân Lập	2070
280717	Xã Lương Trung	2070
280716	Xã Lương Nội	2070
280715	Xã Lương Ngoại	2070
280714	Xã Lũng Niêm	2070
280713	Xã Lũng Cao	2070
280712	Xã Lâm Sa	2070
280711	Xã Kỳ Tân	2070
280710	Xã Hạ Trung	2070
280709	Xã Điền Trung	2070
280708	Xã Điền Thượng	2070
280707	Xã Điền Quang	2070
280706	Xã Điền Lư	2070
280705	Xã Điền Hạ	2070
280704	Xã Cổ Lũng	2070
280703	Xã Ban Công	2070
280702	Xã Ái Thượng	2070
280701	Thị trấn Cành Nàng	2070
90790	Thị trấn Sơn Lư	2000
280513	Xã Trung Xuân	2000
280512	Xã Trung Tiến	2000
280511	Xã Trung Thượng	2000
280510	Xã Trung Hạ	2000
280509	Xã Tam Thanh	2000
280508	Xã Tam Lư	2000
280507	Xã Sơn Thủy	2000
280506	Xã Sơn Lư	2000
280505	Xã Sơn Hà	2000
280504	Xã Sơn Điện	2000
280503	Xã Na Mèo	2000
280502	Xã Mường Mìn	2000
280501	Thị trấn Quan Sơn	2000
282427	Xã Xuân Lộc	1942
282426	Xã Văn Lộc	1942
282425	Xã Tuy Lộc	1942
282424	Xã Triệu Lộc	1942
282423	Xã Tiến Lộc	1942
282422	Xã Thuần Lộc	1942
282421	Xã Thịnh Lộc	1942
282420	Xã Thành Lộc	1942
282419	Xã Quang Lộc	1942
282418	Xã Phú Lộc	1942
282417	Xã Phong Lộc	1942
282416	Xã Ngư Lộc	1942
282415	Xã Mỹ Lộc	1942
282414	Xã Minh Lộc	1942
282413	Xã Lộc Tân	1942
282412	Xã Lộc Sơn	1942
282411	Xã Liên Lộc	1942
282410	Xã Hưng Lộc	1942
282409	Xã Hòa Lộc	1942
282408	Xã Hoa Lộc	1942
282407	Xã Hải Lộc	1942
282406	Xã Đồng Lộc	1942
282405	Xã Đại Lộc	1942
282404	Xã Đa Lộc	1942
282403	Xã Châu Lộc	1942
282402	Xã Cầu Lộc	1942
282401	Thị trấn Hậu Lộc	1942
282015	Xã Đông Yên	1927
282014	Xã Đông Văn	1927
282013	Xã Đông Tiến	1927
282012	Xã Đông Thịnh	1927
282011	Xã Đông Thanh	1927
282010	Xã Đông Quang	1927
282009	Xã Đông Phú	1927
282008	Xã Đông Ninh	1927
282007	Xã Đông Nam	1927
282006	Xã Đông Minh	1927
282005	Xã Đông Khê	1927
282004	Xã Đông Hoàng	1927
282003	Xã Đông Hòa	1927
282002	Xã Đông Anh	1927
282001	Thị trấn Rừng Thông	1927
800152	Xã Minh Tân	1881
800133	Xã Ninh Khang	1881
281616	Xã Vĩnh Yên	1881
281615	Xã Vĩnh Tiến	1881
281614	Xã Vĩnh Thịnh	1881
281613	Xã Vĩnh Thành	1881
281612	Xã Vĩnh Tân	1881
281611	Xã Vĩnh Quang	1881
281610	Xã Vĩnh Phúc	1881
281609	Xã Vĩnh Ninh	1881
281608	Xã Vĩnh Minh	1881
281607	Xã Vĩnh Long	1881
281606	Xã Vĩnh Khang	1881
281605	Xã Vĩnh Hưng	1881
281604	Xã Vĩnh Hùng	1881
281603	Xã Vĩnh Hòa	1881
281602	Xã Vĩnh An	1881
281601	Thị trấn Vĩnh Lộc	1881
281328	Xã Thành Yên	1880
281327	Xã Thành Vinh	1880
281326	Xã Thành Vân	1880
281325	Xã Thành Trực	1880
281324	Xã Thành Tiến	1880
281323	Xã Thành Thọ	1880
281322	Xã Thành Tân	1880
281321	Xã Thành Tâm	1880
281320	Xã Thành Mỹ	1880
281319	Xã Thành Minh	1880
281318	Xã Thành Long	1880
281317	Xã Thành Kim	1880
281316	Xã Thành Hưng	1880
281315	Xã Thành Công	1880
281314	Xã Thành An	1880
281313	Xã Thạch Tượng	1880
281312	Xã Thạch Tân	1880
281311	Xã Thạch Sơn	1880
281310	Xã Thạch Quảng	1880
281309	Xã Thạch Long	1880
281308	Xã Thạch Lâm	1880
281307	Xã Thạch Đồng	1880
281306	Xã Thạch Định	1880
281305	Xã Thạch Cẩm	1880
281304	Xã Thạch Bình	1880
281303	Xã Ngọc Trạo	1880
281302	Thị trấn Vân Du	1880
281301	Thị trấn Kim Tân	1880
90789	Thị trấn Hồi Xuân	1879
280418	Xã Xuân Phú	1879
280417	Xã Trung Thành	1879
280416	Xã Trung Sơn	1879
280415	Xã Thiên Phủ	1879
280414	Xã Thanh Xuân	1879
280413	Xã Thành Sơn	1879
280412	Xã Phú Xuân	1879
280411	Xã Phú Thanh	1879
280410	Xã Phú Sơn	1879
280409	Xã Phú Nghiêm	1879
280408	Xã Phú Lệ	1879
280407	Xã Nam Xuân	1879
280406	Xã Nam Tiến	1879
280405	Xã Nam Động	1879
280404	Xã Hồi Xuân	1879
280403	Xã Hiền Kiệt	1879
280402	Xã Hiền Chung	1879
280401	Thị trấn Quan Hóa	1879
280609	Xã Trung Lý	1878
280608	Xã Tén Tằn	1878
280607	Xã Tam Chung	1878
280606	Xã Quang Chiểu	1878
280605	Xã Pù Nhi	1878
280604	Xã Nhi Sơn	1878
280603	Xã Mường Lý	1878
280602	Xã Mường Chanh	1878
280601	Thị trấn Mường Lát	1878
91457	Xã Thái Lai	1877
800149	Xã Yến Sơn	1877
800148	Xã Yên Dương	1877
800122	Xã Lĩnh Toại	1877
800121	Xã Hoạt Giang	1877
282125	Xã Hà Yên	1877
282124	Xã Hà Vinh	1877
282123	Xã Hà Vân	1877
282122	Xã Hà Toại	1877
282121	Xã Hà Tiến	1877
282120	Xã Hà Thanh	1877
282119	Xã Hà Thái	1877
282118	Xã Hà Tân	1877
282117	Xã Hà Sơn	1877
282116	Xã Hà Phú	1877
282115	Xã Hà Phong	1877
282114	Xã Hà Ninh	1877
282113	Xã Hà Ngọc	1877
282112	Xã Hà Long	1877
282111	Xã Hà Lĩnh	1877
282110	Xã Hà Lâm	1877
282109	Xã Hà Lai	1877
282108	Xã Hà Hải	1877
282107	Xã Hà Giang	1877
282106	Xã Hà Dương	1877
282105	Xã Hà Đông	1877
282104	Xã Hà Châu	1877
282103	Xã Hà Bình	1877
282102	Xã Hà Bắc	1877
282101	Thị trấn Hà Trung	1877
280208	Xã Quang Trung	1876
280207	Xã Hà Lan	1876
280206	Phường Phú Sơn	1876
280205	Phường Ngọc Trạo	1876
280204	Phường Lam Sơn	1876
280203	Phường Đông Sơn	1876
280202	Phường Bắc Sơn	1876
280201	Phường Ba Đình	1876
282729	Xã Yên Trường	1875
282728	Xã Yên Trung	1875
282727	Xã Yên Thọ	1875
282726	Xã Yên Thịnh	1875
282725	Xã Yên Thái	1875
282724	Xã Yên Tâm	1875
282723	Xã Yên Phú	1875
282722	Xã Yên Phong	1875
282721	Xã Yên Ninh	1875
282720	Xã Yên Lâm	1875
282719	Xã Yên Lạc	1875
282718	Xã Yên Hùng	1875
282717	Xã Yên Giang	1875
282716	Xã Yên Bái	1875
282715	Thị trấn Quý Lộc	1875
282714	Xã Định Tường	1875
282713	Xã Định Tiến	1875
282712	Xã Định Thành	1875
282711	Xã Định Tăng	1875
282710	Xã Định Tân	1875
282709	Xã Định Long	1875
282708	Xã Định Liên	1875
282707	Xã Định Hưng	1875
282706	Xã Định Hòa	1875
282705	Xã Định Hải	1875
282704	Xã Định Công	1875
282703	Xã Định Bình	1875
282702	Thị trấn Thống Nhất	1875
282701	Thị trấn Quán Lào	1875
281222	Xã Vân Âm	1874
281221	Xã Thúy Sơn	1874
281220	Xã Thạch Lập	1874
281219	Xã Quang Trung	1874
281218	Xã Phùng Minh	1874
281217	Xã Phùng Giáo	1874
281216	Xã Phúc Thịnh	1874
281215	Xã Nguyệt Ấn	1874
281214	Xã Ngọc Trung	1874
281213	Xã Ngọc Sơn	1874
281212	Xã Ngọc Liên	1874
281211	Xã Ngọc Khê	1874
281210	Xã Mỹ Tân	1874
281209	Xã Minh Tiến	1874
281208	Xã Minh Sơn	1874
281207	Xã Lộc Thịnh	1874
281206	Xã Lam Sơn	1874
281205	Xã Kiên Thọ	1874
281204	Xã Đồng Thịnh	1874
281203	Xã Cao Thịnh	1874
281202	Xã Cao Ngọc	1874
281201	Thị Trấn Ngọc Lặc	1874
800131	Xã Xuân Sinh	1873
800130	Xã Xuân Hồng	1873
800129	Xã Trường Xuân	1873
800128	Xã Thuận Minh	1873
800127	Xã Phú Xuân	1873
281541	Xã Xuân Yên	1873
281540	Xã Xuân Vinh	1873
281539	Xã Xuân Trường	1873
281538	Xã Xuân Tín	1873
281537	Xã Xuân Thiên	1873
281536	Xã Xuân Thành	1873
281535	Xã Xuân Thắng	1873
281534	Xã Xuân Tân	1873
281533	Xã Xuân Sơn	1873
281532	Xã Xuân Quang	1873
281531	Xã Xuân Phú	1873
281530	Xã Xuân Phong	1873
281529	Xã Xuân Minh	1873
281528	Xã Xuân Lập	1873
281527	Xã Xuân Lam	1873
281526	Xã Xuân Lai	1873
281525	Xã Xuân Khánh	1873
281524	Xã Xuân Hưng	1873
281523	Xã Xuân Hòa	1873
281522	Xã Xuân Giang	1873
281521	Xã Xuân Châu	1873
281520	Xã Xuân Bái	1873
281519	Xã Thọ Xương	1873
281518	Xã Thọ Trường	1873
281517	Xã Thọ Thắng	1873
281516	Xã Thọ Nguyên	1873
281515	Xã Thọ Minh	1873
281514	Xã Thọ Lộc	1873
281513	Xã Thọ Lập	1873
281512	Xã Thọ Lâm	1873
281511	Xã Thọ Hải	1873
281510	Xã Thọ Diên	1873
281509	Xã Tây Hồ	1873
281508	Xã Quảng Phú	1873
281507	Xã Phú Yên	1873
281506	Xã Nam Giang	1873
281505	Xã Hạnh Phúc	1873
281504	Xã Bắc Lương	1873
281503	Thị trấn Thọ Xuân	1873
281502	Thị trấn Sao Vàng	1873
281501	Thị trấn Lam Sơn	1873
280817	Xã Yên Nhân	1872
280816	Xã Xuân Thắng	1872
280815	Xã Xuân Lộc	1872
280814	Xã Xuân Lẹ	1872
280813	Xã Xuân Dương	1872
280812	Xã Xuân Chinh	1872
280811	Xã Xuân Cao	1872
280810	Xã Xuân Cẩm	1872
280809	Xã Vạn Xuân	1872
280808	Xã Thọ Thanh	1872
280807	Xã Tân Thành	1872
280806	Xã Ngọc Phụng	1872
280805	Xã Lương Sơn	1872
280804	Xã Luận Thành	1872
280803	Xã Luận Khê	1872
280802	Xã Bát Mọt	1872
280801	Thị trấn Thường Xuân	1872
280918	Xã Yên Lễ	1871
280917	Xã Xuân Quỳ	1871
280916	Xã Xuân Hòa	1871
280915	Xã Xuân Bình	1871
280914	Xã Thượng Ninh	1871
280913	Xã Thanh Xuân	1871
280912	Xã Thanh Sơn	1871
280911	Xã Thanh Quân	1871
280910	Xã Thanh Phong	1871
280909	Xã Thanh Lâm	1871
280908	Xã Thanh Hòa	1871
280907	Xã Tân Bình	1871
280906	Xã Hóa Quỳ	1871
280905	Xã Cát Vân	1871
280904	Xã Cát Tân	1871
280903	Xã Bình Lương	1871
280902	Xã Bãi Trành	1871
280901	Thị trấn Yên Cát	1871
282634	Phường Xuân Lâm	1870
282633	Xã Tùng Lâm	1870
282632	Xã Trường Lâm	1870
282631	Phường Trúc Lâm	1870
282630	Xã Triêu Dương	1870
282629	Phường Tĩnh Hải	1870
282628	Xã Thanh Thủy	1870
282627	Xã Thanh Sơn	1870
282626	Xã Tân Trường	1870
282625	Xã Tân Dân	1870
282624	Xã Phú Sơn	1870
282623	Xã Phú Lâm	1870
282622	Phường Ninh Hải	1870
282621	Phường Nguyên Bình	1870
282620	Xã Ngọc Lĩnh	1870
282619	Xã Nghi Sơn	1870
282618	Phường Mai Lâm	1870
282617	Xã Hùng Sơn	1870
282616	Xã Hải Yến	1870
282615	Phường Hải Thượng	1870
282614	Phường Hải Thanh	1870
282613	Phường Hải Ninh	1870
282612	Xã Hải Nhân	1870
282611	Phường Hải Lĩnh	1870
282610	Phường Hải Hòa	1870
282609	Xã Hải Hà	1870
282608	Phường Hải Châu	1870
282607	Phường Hải Bình	1870
282606	Phường Hải An	1870
282605	Xã Định Hải	1870
282604	Xã Các Sơn	1870
282603	Phường Bình Minh	1870
282602	Xã Anh Sơn	1870
282601	Thị trấn Tĩnh Gia	1870
800141	Thị Trấn Bút Sơn	1748
282243	Xã Hoằng Yến	1748
282242	Xã Hoằng Xuyên	1748
282241	Xã Hoằng Xuân	1748
282240	Xã Hoằng Vinh	1748
282239	Xã Hoằng Trường	1748
282238	Xã Hoằng Trung	1748
282237	Xã Hoằng Trinh	1748
282236	Xã Hoằng Trạch	1748
282235	Xã Hoằng Tiến	1748
282234	Xã Hoằng Thịnh	1748
282233	Xã Hoằng Thành	1748
282232	Xã Hoằng Thanh	1748
282231	Xã Hoằng Thắng	1748
282230	Xã Hoằng Thái	1748
282229	Xã Hoằng Tân	1748
282228	Xã Hoằng Sơn	1748
282227	Xã Hoằng Quỳ	1748
282226	Xã Hoằng Quý	1748
282225	Xã Hoằng Phượng	1748
282224	Xã Hoằng Phúc	1748
282223	Xã Hoằng Phụ	1748
282222	Xã Hoằng Phú	1748
282221	Xã Hoằng Phong	1748
282220	Xã Hoằng Ngọc	1748
282219	Xã Hoằng Minh	1748
282218	Xã Hoằng Lưu	1748
282217	Xã Hoằng Lương	1748
282216	Xã Hoằng Lộc	1748
282215	Xã Hoằng Kim	1748
282214	Xã Hoằng Khê	1748
282213	Xã Hoằng Khánh	1748
282212	Xã Hoằng Hợp	1748
282211	Xã Hoằng Hải	1748
282210	Xã Hoằng Hà	1748
282209	Xã Hoằng Giang	1748
282208	Xã Hoằng Đức	1748
282207	Xã Hoằng Đồng	1748
282206	Xã Hoằng Đông	1748
282205	Xã Hoằng Đạt	1748
282204	Xã Hoằng Đạo	1748
282203	Xã Hoằng Châu	1748
282202	Xã Hoằng Cát	1748
282201	Thị trấn Hoằng Hóa	1748
800150	Thị Trấn Tân Phong	1747
800124	Xã Tiên Trang	1747
282530	Xã Quảng Yên	1747
282529	Xã Quảng Vọng	1747
282528	Xã Quảng Văn	1747
282527	Xã Quảng Trường	1747
282526	Xã Quảng Trung	1747
282525	Xã Quảng Trạch	1747
282524	Xã Quảng Thái	1747
282523	Xã Quảng Thạch	1747
282522	Xã Quảng Tân	1747
282521	Xã Quảng Phúc	1747
282520	Xã Quảng Phong	1747
282519	Xã Quảng Ninh	1747
282518	Xã Quảng Nhân	1747
282517	Xã Quảng Nham	1747
282516	Xã Quảng Ngọc	1747
282515	Xã Quảng Lưu	1747
282514	Xã Quảng Long	1747
282513	Xã Quảng Lợi	1747
282512	Xã Quảng Lộc	1747
282511	Xã Quảng Lĩnh	1747
282510	Xã Quảng Khê	1747
282509	Xã Quảng Hợp	1747
282508	Xã Quảng Hòa	1747
282507	Xã Quảng Hải	1747
282506	Xã Quảng Giao	1747
282505	Xã Quảng Đức	1747
282504	Xã Quảng Định	1747
282503	Xã Quảng Chính	1747
282502	Xã Quảng Bình	1747
282501	Thị trấn Quảng Xương	1747
91456	Xã Đại Hùng	1712
280311	Phường Quảng Vinh	1712
280310	Xã Quảng Thọ	1712
280309	Xã Quảng Minh	1712
280308	Xã Quảng Hùng	1712
280307	Xã Quảng Đại	1712
280306	Phường Quảng Cư	1712
280305	Phường Quảng Châu	1712
280304	Phường Trường Sơn	1712
280303	Phường Trung Sơn	1712
280302	Phường Quảng Tiến	1712
280301	Phường Bắc Sơn	1712
91629	Xã Đông Xuân	1616
91455	Xã Đông Quang	1616
91454	Xã Đông Nam	1616
91453	Xã Đông Phú	1616
91452	Xã Đông Văn	1616
91451	Phường Đông Thịnh	1616
91450	Xã Đông Khê	1616
91449	Xã Đông Tiến	1616
91448	Xã Đông Thanh	1616
91447	Xã Đông Minh	1616
91446	Xã Đông Yên	1616
91445	Xã Đông Hòa	1616
91444	Xã Đông Ninh	1616
91443	Xã Đông Hoàng	1616
91442	Phường Rừng Thông	1616
800206	Phường An Hưng	1616
800196	Xã Long Anh	1616
280137	Xã Thiệu Vân	1616
280136	Xã Thiệu Khánh	1616
280135	Xã Thiệu Dương	1616
280134	Xã Quảng Thịnh	1616
280133	Xã Quảng Tâm	1616
280132	Xã Quảng Phú	1616
280131	Xã Quảng Đông	1616
280130	Xã Quảng Cát	1616
280129	Xã Hoằng Quang	1616
280128	Xã Hoằng Lý	1616
280127	Xã Hoằng Long	1616
280126	Xã Hoằng Đại	1616
280125	Xã Hoằng Anh	1616
280124	Xã Đông Vinh	1616
280123	Xã Đông Tân	1616
280122	Xã Đông Lĩnh	1616
280121	Xã Đông Hưng	1616
280120	Phường Trường Thi	1616
280119	Phường Tào Xuyên	1616
280118	Phường Tân Sơn	1616
280117	Phường Quảng Thành	1616
280116	Phường Quảng Thắng	1616
280115	Phường Quảng Hưng	1616
280114	Phường Phú Sơn	1616
280113	Phường Ngọc Trạo	1616
280112	Phường Nam Ngạn	1616
280111	Phường Lam Sơn	1616
280110	Phường Hàm Rồng	1616
280109	Phường Đông Vệ	1616
280108	Phường Đông Thọ	1616
280107	Phường Đông Sơn	1616
280106	Phường Đông Hương	1616
280105	Phường Đông Hải	1616
280104	Phường Đông Cương	1616
280103	Phường Điện Biên	1616
280102	Phường Ba Đình	1616
280101	Phường An Hoạch	1616
270617	Xã Yên Từ	3327
270616	Xã Yên Thành	3327
270615	Xã Yên Thắng	3327
270614	Xã Yên Thái	3327
270613	Xã Yên Phong	3327
270612	Xã Yên Nhân	3327
270611	Xã Yên Mỹ	3327
270610	Xã Yên Mạc	3327
270609	Xã Yên Lâm	3327
270608	Xã Yên Hưng	3327
270607	Xã Yên Hòa	3327
270606	Xã Yên Đồng	3327
270605	Xã Mai Sơn	3327
270604	Xã Khánh Thượng	3327
270603	Xã Khánh Thịnh	3327
270602	Xã Khánh Dương	3327
270601	Thị trấn Yên Thịnh	3327
91428	Xã Phúc Sơn	3247
91427	Xã Thanh Sơn	3247
270327	Xã Yên Quang	3247
270326	Xã Xích Thổ	3247
270325	Xã Văn Phương	3247
270324	Xã Văn Phú	3247
270323	Xã Văn Phong	3247
270322	Xã Thượng Hòa	3247
270321	Xã Thanh Lạc	3247
270320	Xã Thạch Bình	3247
270319	Xã Sơn Thành	3247
270318	Xã Sơn Lai	3247
270317	Xã Sơn Hà	3247
270316	Xã Quỳnh Lưu	3247
270315	Xã Quảng Lạc	3247
270314	Xã Phú Sơn	3247
270313	Xã Phú Long	3247
270312	Xã Phú Lộc	3247
270311	Xã Lạng Phong	3247
270310	Xã Lạc Vân	3247
270309	Xã Kỳ Phú	3247
270308	Xã Gia Tường	3247
270307	Xã Gia Thủy	3247
270306	Xã Gia Sơn	3247
270305	Xã Gia Lâm	3247
270304	Xã Đức Long	3247
270303	Xã Đồng Phong	3247
270302	Xã Cúc Phương	3247
270301	Thị trấn Nho Quan	3247
800283	Xã Xuân Chính	3205
270727	Xã Yên Mật	3205
270726	Xã Yên Lộc	3205
270725	Xã Xuân Thiện	3205
270724	Xã Văn Hải	3205
270723	Xã Thượng Kiệm	3205
270722	Xã Tân Thành	3205
270721	Xã Quang Thiện	3205
270720	Xã Như Hòa	3205
270719	Xã Lưu Phương	3205
270718	Xã Lai Thành	3205
270717	Xã Kim Trung	3205
270716	Xã Kim Tân	3205
270715	Xã Kim Mỹ	3205
270714	Xã Kim Hải	3205
270713	Xã Kim Đông	3205
270712	Xã Kim Định	3205
270711	Xã Kim Chính	3205
270710	Xã Hùng Tiến	3205
270709	Xã Hồi Ninh	3205
270708	Xã Đồng Hướng	3205
270707	Xã Định Hóa	3205
270706	Xã Cồn Thoi	3205
270705	Xã Chính Tâm	3205
270704	Xã Chất Bình	3205
270703	Xã Ân Hòa	3205
270702	Thị trấn Phát Diệm	3205
270701	Thị trấn Bình Minh	3205
91430	Xã Tiến Thắng	3191
91429	Thị trấn Thịnh Vượng	3191
270421	Xã Liên Sơn	3191
270420	Xã Gia Xuân	3191
270419	Xã Gia Vượng	3191
270418	Xã Gia Vân	3191
270417	Xã Gia Trung	3191
270416	Xã Gia Trấn	3191
270415	Xã Gia Tiến	3191
270414	Xã Gia Thịnh	3191
270413	Xã Gia Thanh	3191
270412	Xã Gia Thắng	3191
270411	Xã Gia Tân	3191
270410	Xã Gia Sinh	3191
270409	Xã Gia Phương	3191
270408	Xã Gia Phú	3191
270407	Xã Gia Phong	3191
270406	Xã Gia Minh	3191
270405	Xã Gia Lập	3191
270404	Xã Gia Lạc	3191
270403	Xã Gia Hưng	3191
270402	Xã Gia Hòa	3191
270401	Thị trấn Me	3191
91441	Phường Ninh Phong	1944
91440	Phường Ninh Sơn	1944
91439	Phường Ninh Phúc	1944
91438	Xã Ninh Tiến	1944
91437	Xã Ninh Nhất	1944
91436	Phường Ninh Khánh	1944
91435	Phường Nam Thành	1944
91434	Phường Nam Bình	1944
91433	Phường Vân Giang	1944
91432	Phường Tân Thành	1944
91431	Phường Đông Thành	1944
90846	Phường Bích Đào	1944
270511	Xã Trường Yên	1944
270510	Xã Ninh Xuân	1944
270509	Xã Ninh Vân	1944
270508	Xã Ninh Thắng	1944
270507	Xã Ninh Mỹ	1944
270506	Xã Ninh Khang	1944
270505	Xã Ninh Hòa	1944
270504	Xã Ninh Hải	1944
270503	Xã Ninh Giang	1944
270502	Xã Ninh An	1944
270501	Thị trấn Thiên Tôn	1944
270819	Xã Khánh Vân	1714
270818	Xã Khánh Trung	1714
270817	Xã Khánh Tiên	1714
270816	Xã Khánh Thủy	1714
270815	Xã Khánh Thiện	1714
270814	Xã Khánh Thành	1714
270813	Xã Khánh Phú	1714
270812	Xã Khánh Nhạc	1714
270811	Xã Khánh Mậu	1714
270810	Xã Khánh Lợi	1714
270809	Xã Khánh Hồng	1714
270808	Xã Khánh Hội	1714
270807	Xã Khánh Hòa	1714
270806	Xã Khánh Hải	1714
270805	Xã Khánh Cường	1714
270804	Xã Khánh Cư	1714
270803	Xã Khánh Công	1714
270802	Xã Khánh An	1714
270801	Thị trấn Yên Ninh	1714
270209	Xã Yên Sơn	1713
270208	Xã Quang Sơn	1713
270207	Xã Đông Sơn	1713
270206	Phường Yên Bình	1713
270205	Phường Trung Sơn	1713
270204	Phường Tây Sơn	1713
270203	Phường Tân Bình	1713
270202	Phường Nam Sơn	1713
270201	Phường Bắc Sơn	1713
270114	Xã Ninh Tiến	1615
270113	Xã Ninh Phúc	1615
270112	Xã Ninh Nhất	1615
270111	Phường Vân Giang	1615
270110	Phường Thanh Bình	1615
270109	Phường Tân Thành	1615
270108	Phường Phúc Thành	1615
270107	Phường Ninh Sơn	1615
270106	Phường Ninh Phong	1615
270105	Phường Ninh Khánh	1615
270104	Phường Nam Thành	1615
270103	Phường Nam Bình	1615
270102	Phường Đông Thành	1615
270101	Phường Bích Đào	1615
800142	Thị Trấn Tân Thanh	2027
240517	Xã Thanh Thủy	2027
240516	Xã Thanh Tân	2027
240515	Xã Thanh Tâm	2027
240514	Xã Thanh Phong	2027
240513	Xã Thanh Nguyên	2027
240512	Xã Thanh Nghị	2027
240511	Xã Thanh Lưu	2027
240510	Xã Thanh Hương	2027
240509	Xã Thanh Hải	2027
240508	Xã Thanh Hà	2027
240507	Xã Thanh Bình	2027
240506	Xã Liêm Túc	2027
240505	Xã Liêm Thuận	2027
240504	Xã Liêm Sơn	2027
240503	Xã Liêm Phong	2027
240502	Xã Liêm Cần	2027
240501	Thị trấn Kiện Khê	2027
800006	Xã Trần Hưng Đạo	1970
240423	Xã Xuân Khê	1970
240422	Xã Văn Lý	1970
240421	Xã Tiến Thắng	1970
240420	Xã Phú Phúc	1970
240419	Xã Nhân Thịnh	1970
240418	Xã Nhân Nghĩa	1970
240417	Xã Nhân Mỹ	1970
240416	Xã Nhân Khang	1970
240415	Xã Nhân Hưng	1970
240414	Xã Nhân Đạo	1970
240413	Xã Nhân Chính	1970
240412	Xã Nhân Bình	1970
240411	Xã Nguyên Lý	1970
240410	Xã Hợp Lý	1970
240409	Xã Hòa Hậu	1970
240408	Xã Đức Lý	1970
240407	Xã Đồng Lý	1970
240406	Xã Đạo Lý	1970
240405	Xã Công Lý	1970
240404	Xã Chính Lý	1970
240403	Xã Chân Lý	1970
240402	Xã Bắc Lý	1970
240401	Thị trấn Vĩnh Trụ	1970
91409	Phường Tân Tựu	1952
240318	Xã Văn Xá	1952
240317	Xã Tượng Lĩnh	1952
240316	Xã Thụy Lôi	1952
240315	Xã Thi Sơn	1952
240314	Xã Thanh Sơn	1952
240313	Xã Tân Sơn	1952
240312	Xã Nhật Tựu	1952
240311	Xã Nhật Tân	1952
240310	Xã Nguyễn Úy	1952
240309	Xã Ngọc Sơn	1952
240308	Xã Liên Sơn	1952
240307	Xã Lê Hồ	1952
240306	Xã Khả Phong	1952
240305	Xã Hoàng Tây	1952
240304	Xã Đồng Hóa	1952
240303	Xã Đại Cương	1952
240302	Thị trấn Quế	1952
240301	Thị trấn Ba Sao	1952
91410	Xã Bình An	1897
240619	Xã Vũ Bản	1897
240618	Xã Trung Lương	1897
240617	Xã Tràng An	1897
240616	Xã Tiêu Động	1897
240615	Xã Ngọc Lũ	1897
240614	Xã Mỹ Thọ	1897
240613	Xã La Sơn	1897
240612	Xã Hưng Công	1897
240611	Xã Đồng Du	1897
240610	Xã Đồn Xá	1897
240609	Xã Bối Cầu	1897
240608	Xã Bồ Đề	1897
240607	Xã Bình Nghĩa	1897
240606	Xã An Nội	1897
240605	Xã An Ninh	1897
240604	Xã An Mỹ	1897
240603	Xã An Lão	1897
240602	Xã An Đổ	1897
240601	Thị trấn Bình Mỹ	1897
91408	Xã Mộc Hoàn	1802
800155	Xã Tiên Sơn	1802
240218	Xã Yên Nam	1802
240217	Xã Yên Bắc	1802
240216	Xã Trác Văn	1802
240215	Xã Tiền Phong	1802
240214	Xã Tiên Nội	1802
240213	Xã Tiên Ngoại	1802
240212	Xã Mộc Nam	1802
240211	Xã Mộc Bắc	1802
240210	Xã Hoàng Đông	1802
240209	Xã Duy Minh	1802
240208	Xã Duy Hải	1802
240207	Xã Đọi Sơn	1802
240206	Xã Chuyên Ngoại	1802
240205	Xã Châu Sơn	1802
240204	Xã Châu Giang	1802
240203	Xã Bạch Thượng	1802
240202	Thị trấn Hòa Mạc	1802
240201	Thị trấn Đồng Văn	1802
91407	Phường Tân Liêm	1614
91406	Phường Tân Hiệp	1614
91405	Phường Châu Cầu	1614
800171	Phường Lam Hạ	1614
240121	Xã Trịnh Xá	1614
240120	Xã Tiên Tân	1614
240119	Xã Tiên Hiệp	1614
240118	Xã Tiên Hải	1614
240117	Xã Phù Vân	1614
240116	Xã Liêm Tuyền	1614
240115	Xã Liêm Tiết	1614
240114	Xã Liêm Chung	1614
240113	Xã Kim Bình	1614
240112	Xã Đinh Xá	1614
240111	Phường Trần Hưng Đạo	1614
240110	Phường Thanh Tuyền	1614
240109	Phường Thanh Châu	1614
240108	Phường Quang Trung	1614
240107	Phường Minh Khai	1614
240106	Phường Lương Khánh Thiện	1614
240105	Phường Liêm Chính	1614
240104	Phường Lê Hồng Phong	1614
240103	Phường Lam Hà	1614
240102	Phường Hai Bà Trưng	1614
240101	Phường Châu Sơn	1614
91426	Xã Xuân Phúc	3323
91425	Xã Trà Lũ	3323
91424	Xã Xuân Giang	3323
250320	Xã Xuân Vinh	3323
250319	Xã Xuân Trung	3323
250318	Xã Xuân Tiến	3323
250317	Xã Xuân Thủy	3323
250316	Xã Xuân Thượng	3323
250315	Xã Xuân Thành	3323
250314	Xã Xuân Tân	3323
250313	Xã Xuân Phương	3323
250312	Xã Xuân Phú	3323
250311	Xã Xuân Phong	3323
250310	Xã Xuân Ninh	3323
250309	Xã Xuân Ngọc	3323
250308	Xã Xuân Kiên	3323
250307	Xã Xuân Hồng	3323
250306	Xã Xuân Hòa	3323
250305	Xã Xuân Đài	3323
250304	Xã Xuân Châu	3323
250303	Xã Xuân Bắc	3323
250302	Xã Thọ Nghiệp	3323
250301	Thị trấn Xuân Trường	3323
250618	Xã Vĩnh Hào	3319
250617	Xã Trung Thành	3319
250616	Xã Thành Lợi	3319
250615	Xã Tân Thành	3319
250614	Xã Tân Khánh	3319
250613	Xã Tam Thanh	3319
250612	Xã Quang Trung	3319
250611	Xã Minh Thuận	3319
250610	Xã Minh Tân	3319
250609	Xã Liên Minh	3319
250608	Xã Liên Bảo	3319
250607	Xã Kim Thái	3319
250606	Xã Hợp Hưng	3319
250605	Xã Hiển Khánh	3319
250604	Xã Đại Thắng	3319
250603	Xã Đại An	3319
250602	Xã Cộng Hòa	3319
250601	Thị trấn Gôi	3319
800083	Thị Trấn Ninh Cường	3308
250821	Xã Việt Hùng	3308
250820	Xã Trung Đông	3308
250819	Xã Trực Tuấn	3308
250818	Xã Trực Thuận	3308
250817	Xã Trực Thanh	3308
250816	Xã Trực Thắng	3308
250815	Xã Trực Thái	3308
250814	Xã Trực Phú	3308
250813	Xã Trực Nội	3308
250812	Xã Trực Mỹ	3308
250811	Xã Trực Khang	3308
250810	Xã Trực Hưng	3308
250809	Xã Trực Hùng	3308
250808	Xã Trực Đạo	3308
250807	Xã Trực Đại	3308
250806	Xã Trực Cường	3308
250805	Xã Trực Chính	3308
250804	Xã Phương Định	3308
250803	Xã Liêm Hải	3308
250802	Thị trấn Cổ Lễ	3308
250801	Thị trấn Cát Thành	3308
90844	Xã Đồng Thịnh	3243
800282	Xã Phúc Thắng	3243
250925	Xã Nghĩa Trung	3243
250924	Xã Nghĩa Thịnh	3243
250923	Xã Nghĩa Thành	3243
250922	Xã Nghĩa Thắng	3243
250921	Xã Nghĩa Thái	3243
250920	Xã Nghĩa Tân	3243
250919	Xã Nghĩa Sơn	3243
250918	Xã Nghĩa Phúc	3243
250917	Xã Nghĩa Phú	3243
250916	Xã Nghĩa Phong	3243
250915	Xã Nghĩa Minh	3243
250914	Xã Nghĩa Lợi	3243
250913	Xã Nghĩa Lâm	3243
250912	Xã Nghĩa Lạc	3243
250911	Xã Nghĩa Hùng	3243
250910	Xã Nghĩa Hồng	3243
250909	Xã Nghĩa Hải	3243
250908	Xã Nghĩa Đồng	3243
250907	Xã Nghĩa Châu	3243
250906	Xã Nghĩa Bình	3243
250905	Xã Nam Điền	3243
250904	Xã Hoàng Nam	3243
250903	Thị trấn Rạng Đông	3243
250902	Thị trấn Quỹ Nhất	3243
250901	Thị trấn Liễu Đề	3243
90841	Thị trấn Giao Thuỷ	3193
250422	Xã Hồng Thuận	3193
250421	Xã Hoành Sơn	3193
250420	Xã Giao Yến	3193
250419	Xã Giao Xuân	3193
250418	Xã Giao Tiến	3193
250417	Xã Giao Thịnh	3193
250416	Xã Giao Thiện	3193
250415	Xã Giao Thanh	3193
250414	Xã Giao Tân	3193
250413	Xã Giao Phong	3193
250412	Xã Giao Nhân	3193
250411	Xã Giao Long	3193
250410	Xã Giao Lạc	3193
250409	Xã Giao Hương	3193
250408	Xã Giao Hải	3193
250407	Xã Giao Hà	3193
250406	Xã Giao Châu	3193
250405	Xã Giao An	3193
250404	Xã Bình Hòa	3193
250403	Xã Bạch Long	3193
250402	Thị trấn Quất Lâm	3193
250401	Thị trấn Ngô Đồng	3193
91423	Xã Nam Điền	1983
250720	Xã Tân Thịnh	1983
250719	Xã Nghĩa An	1983
250718	Xã Nam Toàn	1983
250717	Xã Nam Tiến	1983
250716	Xã Nam Thanh	1983
250715	Xã Nam Thắng	1983
250714	Xã Nam Thái	1983
250713	Xã Nam Mỹ	1983
250712	Xã Nam Lợi	1983
250711	Xã Nam Hùng	1983
250710	Xã Nam Hồng	1983
250709	Xã Nam Hoa	1983
250708	Xã Nam Hải	1983
250707	Xã Nam Dương	1983
250706	Xã Nam Cường	1983
250705	Xã Hồng Quang	1983
250704	Xã Đồng Sơn	1983
250703	Xã Điền Xá	1983
250702	Xã Bình Minh	1983
250701	Thị trấn Nam Giang	1983
250211	Xã Mỹ Trung	1981
250210	Xã Mỹ Tiến	1981
250209	Xã Mỹ Thuận	1981
250208	Xã Mỹ Thịnh	1981
250207	Xã Mỹ Thành	1981
250206	Xã Mỹ Thắng	1981
250205	Xã Mỹ Tân	1981
250204	Xã Mỹ Phúc	1981
250203	Xã Mỹ Hưng	1981
250202	Xã Mỹ Hà	1981
250201	Thị trấn Mỹ Lộc	1981
91422	Xã Hồng Quang	1841
91421	Xã Phú Hưng	1841
91420	Xã Tân Minh	1841
91419	Xã Trung Nghĩa	1841
250532	Xã Yên Xá	1841
250531	Xã Yên Trung	1841
250530	Xã Yên Trị	1841
250529	Xã Yên Tiến	1841
250528	Xã Yên Thọ	1841
250527	Xã Yên Thành	1841
250526	Xã Yên Thắng	1841
250525	Xã Yên Tân	1841
250524	Xã Yên Quang	1841
250523	Xã Yên Phương	1841
250522	Xã Yên Phúc	1841
250521	Xã Yên Phú	1841
250520	Xã Yên Phong	1841
250519	Xã Yên Ninh	1841
250518	Xã Yên Nhân	1841
250517	Xã Yên Nghĩa	1841
250516	Xã Yên Mỹ	1841
250515	Xã Yên Minh	1841
250514	Xã Yên Lương	1841
250513	Xã Yên Lợi	1841
250512	Xã Yên Lộc	1841
250511	Xã Yên Khánh	1841
250510	Xã Yên Khang	1841
250509	Xã Yên Hưng	1841
250508	Xã Yên Hồng	1841
250507	Xã Yên Dương	1841
250506	Xã Yên Đồng	1841
250505	Xã Yên Cường	1841
250504	Xã Yên Chính	1841
250503	Xã Yên Bình	1841
250502	Xã Yên Bằng	1841
250501	Thị trấn Lâm	1841
251035	Xã Hải Xuân	1840
251034	Xã Hải Vân	1840
251033	Xã Hải Trung	1840
251032	Xã Hải Triều	1840
251031	Xã Hải Toàn	1840
251030	Xã Hải Thanh	1840
251029	Xã Hải Tây	1840
251028	Xã Hải Tân	1840
251027	Xã Hải Sơn	1840
251026	Xã Hải Quang	1840
251025	Xã Hải Phương	1840
251024	Xã Hải Phúc	1840
251023	Xã Hải Phú	1840
251022	Xã Hải Phong	1840
251021	Xã Hải Ninh	1840
251020	Xã Hải Nam	1840
251019	Xã Hải Minh	1840
251018	Xã Hải Lý	1840
251017	Xã Hải Long	1840
251016	Xã Hải Lộc	1840
251015	Xã Hải Hưng	1840
251014	Xã Hải Hòa	1840
251013	Xã Hải Hà	1840
251012	Xã Hải Giang	1840
251011	Xã Hải Đường	1840
251010	Xã Hải Đông	1840
251009	Xã Hải Cường	1840
251008	Xã Hải Chính	1840
251007	Xã Hải Châu	1840
251006	Xã Hải Bắc	1840
251005	Xã Hải Anh	1840
251004	Xã Hải An	1840
251003	Thị trấn Yên Định	1840
251002	Thị trấn Thịnh Long	1840
251001	Thị trấn Cồn	1840
91418	Xã Mỹ Lộc	1613
91417	Xã Mỹ Thuận	1613
91416	Xã Mỹ Phúc	1613
91415	Xã Mỹ Tân	1613
91414	Xã Mỹ Trung	1613
91413	Xã Mỹ Thắng	1613
91412	Xã Mỹ Hà	1613
91411	Phường Hưng Lộc	1613
250125	Xã Nam Vân	1613
250124	Xã Nam Phong	1613
250123	Xã Mỹ Xá	1613
250122	Xã Lộc Hòa	1613
250121	Xã Lộc An	1613
250120	Phường Vị Xuyên	1613
250119	Phường Vị Hoàng	1613
250118	Phường Văn Miếu	1613
250117	Phường Trường Thi	1613
250116	Phường Trần Tế Xương	1613
250115	Phường Trần Quang Khải	1613
250114	Phường Trần Hưng Đạo	1613
250113	Phường Trần Đăng Ninh	1613
250112	Phường Thống Nhất	1613
250111	Phường Quang Trung	1613
250110	Phường Phan Đình Phùng	1613
250109	Phường Nguyễn Du	1613
250108	Phường Ngô Quyền	1613
250107	Phường Năng Tĩnh	1613
250106	Phường Lộc Vượng	1613
250105	Phường Lộc Hạ	1613
250104	Phường Hạ Long	1613
250103	Phường Cửa Nam	1613
250102	Phường Cửa Bắc	1613
250101	Phường Bà Triệu	1613
171213	Xã Vũ Oai	3199
171212	Xã Thống Nhất	3199
171211	Xã Tân Dân	3199
171210	Xã Sơn Dương	3199
171209	Xã Quảng La	3199
171208	Xã Lê Lợi	3199
171207	Xã Kỳ Thượng	3199
171206	Xã Hòa Bình	3199
171205	Xã Đồng Sơn	3199
171204	Xã Đồng Lâm	3199
171203	Xã Dân Chủ	3199
171202	Xã Bằng Cả	3199
171201	Thị trấn Trới	3199
171021	Xã Yên Thọ	3185
171020	Xã Yên Đức	3185
171019	Xã Việt Dân	3185
171018	Xã Tràng Lương	3185
171017	Xã Tràng An	3185
171016	Xã Thủy An	3185
171015	Xã Tân Việt	3185
171014	Xã Nguyễn Huệ	3185
171013	Xã Hồng Thái Tây	3185
171012	Xã Hồng Thái Đông	3185
171011	Xã Hồng Phong	3185
171010	Xã Hoàng Quế	3185
171009	Xã Bình Khê	3185
171008	Xã Bình Dương	3185
171007	Xã An Sinh	3185
171006	Phường Xuân Sơn	3185
171005	Phường Mạo Khê	3185
171004	Phường Kim Sơn	3185
171003	Phường Hưng Đạo	3185
171002	Phường Đức Chính	3185
171001	Phường Đông Triều	3185
170610	Xã Tân Lập	3180
170609	Xã Tân Bình	3180
170608	Xã Quảng Tân	3180
170607	Xã Quảng Lợi	3180
170606	Xã Quảng Lâm	3180
170605	Xã Quảng An	3180
170604	Xã Dực Yên	3180
170603	Xã Đầm Hà	3180
170602	Xã Đại Bình	3180
170601	Thị trấn Đầm Hà	3180
91300	Xã Lương Minh	3126
170908	Xã Thanh Sơn	3126
170907	Xã Thanh Lâm	3126
170906	Xã Nam Sơn	3126
170905	Xã Minh Cầm	3126
170904	Xã Lương Mông	3126
170903	Xã Đồn Đạc	3126
170902	Xã Đạp Thanh	3126
170901	Thị trấn Ba Chẽ	3126
171403	Xã Thanh Lân	2109
171402	Xã Đồng Tiến	2109
171401	Thị trấn Cô Tô	2109
171119	Xã Tiền Phong	2066
171118	Xã Tiền An	2066
171117	Xã Sông Khoai	2066
171116	Xã Liên Vị	2066
171115	Xã Liên Hòa	2066
171114	Xã Hoàng Tân	2066
171113	Xã Hiệp Hòa	2066
171112	Xã Cẩm La	2066
171111	Phường Yên Hải	2066
171110	Phường Yên Giang	2066
171109	Phường Tân An	2066
171108	Phường Quảng Yên	2066
171107	Phường Phong Hải	2066
171106	Phường Phong Cốc	2066
171105	Phường Nam Hoà	2066
171104	Phường Minh Thành	2066
171103	Phường Hà An	2066
171102	Phường Đông Mai	2066
171101	Phường Cộng Hòa	2066
170812	Xã Yên Than	2019
170811	Xã Tiên Lãng	2019
170810	Xã Phong Dụ	2019
170809	Xã Hải Lạng	2019
170808	Xã Hà Lâu	2019
170807	Xã Đồng Rui	2019
170806	Xã Đông Ngũ	2019
170805	Xã Đông Hải	2019
170804	Xã Điền Xá	2019
170803	Xã Đại Thành	2019
170802	Xã Đại Dực	2019
170801	Thị trấn Tiên Yên	2019
170716	Xã Tiến Tới	1940
170715	Xã Quảng Trung	1940
170714	Xã Quảng Thịnh	1940
170713	Xã Quảng Thành	1940
170712	Xã Quảng Thắng	1940
170711	Xã Quảng Sơn	1940
170710	Xã Quảng Phong	1940
170709	Xã Quảng Minh	1940
170708	Xã Quảng Long	1940
170707	Xã Quảng Đức	1940
170706	Xã Quảng Điền	1940
170705	Xã Quảng Chính	1940
170704	Xã Phú Hải	1940
170703	Xã Đường Hoa	1940
170702	Xã Cái Chiên	1940
170701	Thị trấn Quảng Hà	1940
171312	Xã Vạn Yên	1920
171311	Xã Thắng Lợi	1920
171310	Xã Quan Lạn	1920
171309	Xã Ngọc Vừng	1920
171308	Xã Minh Châu	1920
171307	Xã Hạ Long	1920
171306	Xã Đông Xá	1920
171305	Xã Đoàn Kết	1920
171304	Xã Đài Xuyên	1920
171303	Xã Bình Dân	1920
171302	Xã Bản Sen	1920
171301	Thị trấn Cái Rồng	1920
170508	Xã Vô Ngại	1896
170507	Xã Tình Húc	1896
170506	Xã Lục Hồn	1896
170505	Xã Húc Động	1896
170504	Xã Hoành Mô	1896
170503	Xã Đồng Văn	1896
170502	Xã Đồng Tâm	1896
170501	Thị trấn Bình Liêu	1896
170311	Xã Thượng Yên Công	1686
170310	Xã Điền Công	1686
170309	Phường Yên Thanh	1686
170308	Phường Vàng Danh	1686
170307	Phường Trưng Vương	1686
170306	Phường Thanh Sơn	1686
170305	Phường Quang Trung	1686
170304	Phường Phương Nam	1686
170303	Phường Phương Đông	1686
170302	Phường Nam Khê	1686
170301	Phường Bắc Sơn	1686
91299	Xã Hải Hòa	1683
170216	Xã Dương Huy	1683
170215	Xã Cộng Hòa	1683
170214	Xã Cẩm Hải	1683
170213	Phường Quang Hanh	1683
170212	Phường Mông Dương	1683
170211	Phường Cửa Ông	1683
170210	Phường Cẩm Trung	1683
170209	Phường Cẩm Thủy	1683
170208	Phường Cẩm Thịnh	1683
170207	Phường Cẩm Thành	1683
170206	Phường Cẩm Thạch	1683
170205	Phường Cẩm Tây	1683
170204	Phường Cẩm Sơn	1683
170203	Phường Cẩm Phú	1683
170202	Phường Cẩm Đông	1683
170201	Phường Cẩm Bình	1683
800262	Phường Hoành Bồ	1604
800208	Thị Trấn Trới	1604
800207	Xã Dân Chủ	1604
800195	Xã Đồng Sơn	1604
800194	Xã Đồng Lâm	1604
800193	Xã Vũ Oai	1604
800192	Xã Tân Dân	1604
800191	Xã Thống Nhất	1604
800190	Xã Sơn Dương	1604
800189	Xã Quảng La	1604
800188	Xã Lê Lợi	1604
800187	Xã Kỳ Thượng	1604
800186	Xã Hòa Bình	1604
800185	Xã Bằng Cả	1604
170120	Phường Yết Kiêu	1604
170119	Phường Việt Hưng	1604
170118	Phường Tuần Châu	1604
170117	Phường Trần Hưng Đạo	1604
170116	Phường Hùng Thắng	1604
170115	Phường Hồng Hải	1604
170114	Phường Hồng Hà	1604
170113	Phường Hồng Gai	1604
170112	Phường Hà Tu	1604
170111	Phường Hà Trung	1604
170110	Phường Hà Phong	1604
170109	Phường Hà Lầm	1604
170108	Phường Hà Khẩu	1604
170107	Phường Hà Khánh	1604
170106	Phường Giếng Đáy	1604
170105	Phường Đại Yên	1604
170104	Phường Cao Xanh	1604
170103	Phường Cao Thắng	1604
170102	Phường Bãi Cháy	1604
170101	Phường Bạch Đằng	1604
170417	Xã Vĩnh Trung	1603
170416	Xã Vĩnh Thực	1603
170415	Xã Vạn Ninh	1603
170414	Xã Quảng Nghĩa	1603
170413	Xã Hải Xuân	1603
170412	Xã Hải Tiến	1603
170411	Xã Hải Sơn	1603
170410	Xã Hải Đông	1603
170409	Xã Bắc Sơn	1603
170408	Phường Trần Phú	1603
170407	Phường Trà Cổ	1603
170406	Phường Ninh Dương	1603
170405	Phường Ka Long	1603
170404	Phường Hoà Lạc	1603
170403	Phường Hải Yên	1603
170402	Phường Hải Hoà	1603
170401	Phường Bình Ngọc	1603
800104	Xã Quảng Yên	3290
150427	Xã Yên Nội	3290
150426	Xã Yển Khê	3290
150425	Xã Vũ Yển	3290
150424	Xã Võ Lao	3290
150423	Xã Vân Lĩnh	3290
150422	Xã Thanh Xá	3290
150421	Xã Thanh Vân	3290
150420	Xã Thanh Hà	3290
150419	Xã Thái Ninh	3290
150418	Xã Sơn Cương	3290
150417	Xã Quảng Nạp	3290
150416	Xã Phương Lĩnh	3290
150415	Xã Ninh Dân	3290
150414	Xã Năng Yên	3290
150413	Xã Mạn Lạn	3290
150412	Xã Lương Lỗ	3290
150411	Xã Khải Xuân	3290
150410	Xã Hoàng Cương	3290
150409	Xã Hanh Cù	3290
150408	Xã Đồng Xuân	3290
150407	Xã Đông Thành	3290
150406	Xã Đông Lĩnh	3290
150405	Xã Đỗ Xuyên	3290
150404	Xã Đỗ Sơn	3290
150403	Xã Đại An	3290
150402	Xã Chí Tiên	3290
150401	Thị trấn Thanh Ba	3290
800103	Xã Vạn Xuân	3272
800102	Xã Lam Sơn	3272
800101	Xã Dân Quyền	3272
800100	Xã Bắc Sơn	3272
15119	Xã Hương Nộn	3272
15118	Xã Hương Nha	3272
15117	Xã Hùng Đô	3272
15116	Xã Hồng Đà	3272
15115	Xã Hiền Quan	3272
15114	Xã Dị Nậu	3272
15113	Xã Dậu Dương	3272
151120	Xã Xuân Quang	3272
15112	Xã Cổ Tiết	3272
151119	Xã Vực Trường	3272
151118	Xã Văn Lương	3272
151117	Xã Tứ Mỹ	3272
151116	Xã Thượng Nông	3272
151115	Xã Thọ Văn	3272
151114	Xã Thanh Uyên	3272
151113	Xã Tề Lễ	3272
151112	Xã Tam Cường	3272
151111	Xã Quang Húc	3272
151110	Xã Phương Thịnh	3272
15111	Thị trấn Hưng Hoá	3272
150717	Xã Xuân Viên	2268
150716	Xã Xuân Thủy	2268
150715	Xã Xuân An	2268
150714	Xã Trung Sơn	2268
150713	Xã Thượng Long	2268
150712	Xã Phúc Khánh	2268
150711	Xã Ngọc Lập	2268
150710	Xã Ngọc Đồng	2268
150709	Xã Nga Hoàng	2268
150708	Xã Mỹ Lương	2268
150707	Xã Mỹ Lung	2268
150706	Xã Minh Hòa	2268
150705	Xã Lương Sơn	2268
150704	Xã Hưng Long	2268
150703	Xã Đồng Thịnh	2268
150702	Xã Đồng Lạc	2268
150701	Thị trấn Yên Lập	2268
800105	Xã Đồng Trung	2237
151215	Xã Yến Mao	2237
151214	Xã Xuân Lộc	2237
151213	Xã Tu Vũ	2237
151212	Xã Trung Thịnh	2237
151211	Xã Trung Nghĩa	2237
151210	Xã Thạch Đồng	2237
151209	Xã Tân Phương	2237
151208	Xã Sơn Thủy	2237
151207	Xã Phượng Mao	2237
151206	Xã Hoàng Xá	2237
151205	Xã Đồng Luận	2237
151204	Xã Đoan Hạ	2237
151203	Xã Đào Xá	2237
151202	Xã Bảo Yên	2237
151201	Thị trấn Thanh Thủy	2237
150210	Xã Văn Lung	2064
150209	Xã Thanh Minh	2064
150208	Xã Phú Hộ	2064
150207	Xã Hà Thạch	2064
150206	Xã Hà Lộc	2064
150205	Phường Trường Thịnh	2064
150204	Phường Thanh Vinh	2064
150203	Phường Phong Châu	2064
150202	Phường Hùng Vương	2064
150201	Phường Âu Cơ	2064
150823	Xã Yên Sơn	2029
150822	Xã Yên Lương	2029
150821	Xã Yên Lãng	2029
150820	Xã Võ Miếu	2029
150819	Xã Văn Miếu	2029
150818	Xã Tinh Nhuệ	2029
150817	Xã Thượng Cửu	2029
150816	Xã Thục Luyện	2029
150815	Xã Thắng Sơn	2029
150814	Xã Thạch Khoán	2029
150813	Xã Tất Thắng	2029
150812	Xã Tân Minh	2029
150811	Xã Tân Lập	2029
150810	Xã Sơn Hùng	2029
150809	Xã Lương Nha	2029
150808	Xã Khả Cửu	2029
150807	Xã Hương Cần	2029
150806	Xã Giáp Lai	2029
150805	Xã Đông Cửu	2029
150804	Xã Địch Quả	2029
150803	Xã Cự Thắng	2029
150802	Xã Cự Đồng	2029
150801	Thị trấn Thanh Sơn	2029
151317	Xã Xuân Sơn	2015
151316	Xã Xuân Đài	2015
151315	Xã Vinh Tiền	2015
151314	Xã Văn Luông	2015
151313	Xã Thu Ngạc	2015
151312	Xã Thu Cúc	2015
151311	Xã Thạch Kiệt	2015
151310	Xã Tân Sơn	2015
151309	Xã Tân Phú	2015
151308	Xã Tam Thanh	2015
151307	Xã Mỹ Thuận	2015
151306	Xã Minh Đài	2015
151305	Xã Long Cốc	2015
151304	Xã Lai Đồng	2015
151303	Xã Kim Thượng	2015
151302	Xã Kiệt Sơn	2015
151301	Xã Đồng Sơn	2015
800099	Xã Bình Phú	1994
150919	Xã Vĩnh Phú	1994
150918	Xã Tử Đà	1994
150917	Xã Trung Giáp	1994
150916	Xã Trị Quận	1994
150915	Xã Trạm Thản	1994
150914	Xã Tiên Phú	1994
150913	Xã Tiên Du	1994
150912	Xã Phù Ninh	1994
150911	Xã Phú Nham	1994
150910	Xã Phú Mỹ	1994
150909	Xã Phú Lộc	1994
150908	Xã Liên Hoa	1994
150907	Xã Lệ Mỹ	1994
150906	Xã Hạ Giáp	1994
150905	Xã Gia Thanh	1994
150904	Xã Bình Bộ	1994
150903	Xã Bảo Thanh	1994
150902	Xã An Đạo	1994
150901	Thị trấn Phong Châu	1994
800098	Xã Phùng Nguyên	1959
151014	Xã Xuân Lũng	1959
151013	Xã Xuân Huy	1959
151012	Xã Vĩnh Lại	1959
151011	Xã Tứ Xã	1959
151010	Xã Tiên Kiên	1959
151009	Xã Thạch Sơn	1959
151008	Xã Sơn Vi	1959
151007	Xã Sơn Dương	1959
151006	Xã Kinh Kệ	1959
151005	Xã Hợp Hải	1959
151004	Xã Cao Xá	1959
151003	Xã Bản Nguyên	1959
151002	Thị trấn Lâm Thao	1959
151001	Thị trấn Hùng Sơn	1959
800097	Xã Tứ Hiệp	1938
150533	Xã Yên Luật	1938
150532	Xã Yên Kỳ	1938
150531	Xã Y Sơn	1938
150530	Xã Xuân Áng	1938
150529	Xã Vụ Cầu	1938
150528	Xã Vô Tranh	1938
150527	Xã Vĩnh Chân	1938
150526	Xã Văn Lang	1938
150525	Xã Quân Khê	1938
150524	Xã Phương Viên	1938
150523	Xã Phụ Khánh	1938
150522	Xã Minh Hạc	1938
150521	Xã Minh Côi	1938
150520	Xã Mai Tùng	1938
150519	Xã Liên Phương	1938
150518	Xã Lệnh Khanh	1938
150517	Xã Lang Sơn	1938
150516	Xã Lâm Lợi	1938
150515	Xã Hương Xạ	1938
150514	Xã Hiền Lương	1938
150513	Xã Hậu Bổng	1938
150512	Xã Hà Lương	1938
150511	Xã Gia Điền	1938
150510	Xã Động Lâm	1938
150509	Xã Đan Thượng	1938
150508	Xã Đan Hà	1938
150507	Xã Đại Phạm	1938
150506	Xã Chuế Lưu	1938
150505	Xã Chính Công	1938
150504	Xã Cáo Điền	1938
150503	Xã Bằng Giã	1938
150502	Xã Ấm Hạ	1938
150501	Thị trấn Hạ Hoà	1938
800108	Xã Phú Lâm	1925
800107	Xã Hợp Nhất	1925
800106	Xã Hùng Xuyên	1925
150328	Xã Yên Kiện	1925
150327	Xã Vụ Quang	1925
150326	Xã Vân Du	1925
150325	Xã Vân Đồn	1925
150324	Xã Tiêu Sơn	1925
150323	Xã Tây Cốc	1925
150322	Xã Sóc Đăng	1925
150321	Xã Quế Lâm	1925
150320	Xã Phương Trung	1925
150319	Xã Phúc Lai	1925
150318	Xã Phú Thứ	1925
150317	Xã Phong Phú	1925
150316	Xã Ngọc Quan	1925
150315	Xã Nghinh Xuyên	1925
150314	Xã Minh Tiến	1925
150313	Xã Minh Phú	1925
150312	Xã Minh Lương	1925
150311	Xã Hữu Đô	1925
150310	Xã Hùng Quan	1925
150309	Xã Hùng Long	1925
150308	Xã Đông Khê	1925
150307	Xã Đại Nghĩa	1925
150306	Xã Chí Đám	1925
150305	Xã Chân Mộng	1925
150304	Xã Ca Đình	1925
150303	Xã Bằng Luân	1925
150302	Xã Bằng Doãn	1925
150301	Thị trấn Đoan Hùng	1925
91337	Xã Nhật Tiến	1905
91336	Xã Phong Thịnh	1905
91335	Xã Minh Thắng	1905
800096	Xã Minh Tân	1905
800095	Xã Hùng Việt	1905
800094	Thị Trấn Cẩm Khê	1905
150631	Xã Yên Tập	1905
150630	Xã Yên Dưỡng	1905
150629	Xã Xương Thịnh	1905
150628	Xã Văn Khúc	1905
150627	Xã Văn Bán	1905
150626	Xã Tuy Lộc	1905
150625	Xã Tùng Khê	1905
150624	Xã Tình Cương	1905
150623	Xã Tiên Lương	1905
150622	Xã Thụy Liễu	1905
150621	Xã Thanh Nga	1905
150620	Xã Tam Sơn	1905
150619	Xã Tạ Xá	1905
150618	Xã Sơn Tình	1905
150617	Xã Sơn Nga	1905
150616	Xã Sai Nga	1905
150615	Xã Phương Xá	1905
150614	Xã Phượng Vĩ	1905
150613	Xã Phùng Xá	1905
150612	Xã Phú Lạc	1905
150611	Xã Phú Khê	1905
150610	Xã Ngô Xá	1905
150609	Xã Hương Lung	1905
150608	Xã Hiền Đa	1905
150607	Xã Đồng Lương	1905
150606	Xã Đồng Cam	1905
150605	Xã Điêu Lương	1905
150604	Xã Chương Xá	1905
150603	Xã Cát Trù	1905
150602	Xã Cấp Dẫn	1905
150601	Thị trấn Sông Thao	1905
150123	Xã Trưng Vương	1602
150122	Xã Thụy Vân	1602
150121	Xã Thanh Đình	1602
150120	Xã Tân Đức	1602
150119	Xã Sông Lô	1602
150118	Xã Phượng Lâu	1602
150117	Xã Kim Đức	1602
150116	Xã Hy Cương	1602
150115	Xã Hùng Lô	1602
150114	Xã Chu Hóa	1602
150113	Phường Vân Phú	1602
150112	Phường Vân Cơ	1602
150111	Phường Tiên Cát	1602
150110	Phường Thọ Sơn	1602
150109	Phường Thanh Miếu	1602
150108	Phường Tân Dân	1602
150107	Phường Nông Trang	1602
150106	Phường Minh Phương	1602
150105	Phường Minh Nông	1602
150104	Phường Gia Cẩm	1602
150103	Phường Dữu Lâu	1602
150102	Phường Bến Gót	1602
150101	Phường Bạch Hạc	1602
91284	Xã Hồng Sơn	3267
90733	Xã Vĩnh Lợi	3267
90732	Xã Vân Sơn	3267
90731	Xã Văn Phú	3267
90730	Xã Tuân Lộ	3267
90729	Xã Tú Thịnh	3267
90728	Xã Trung Yên	3267
90727	Xã Thượng Ấm	3267
90726	Xã Thiện Kế	3267
90725	Xã Thanh Phát	3267
90724	Xã Tân Trào	3267
90723	Xã Tam Đa	3267
90722	Xã Sơn Nam	3267
90721	Xã Sầm Dương	3267
90720	Xã Quyết Thắng	3267
90719	Xã Phúc Ứng	3267
90718	Xã Phú Lương	3267
90717	Xã Ninh Lai	3267
90716	Xã Minh Thanh	3267
90715	Xã Lương Thiện	3267
90714	Xã Lâm Xuyên	3267
90713	Xã Kháng Nhật	3267
90712	Xã Hợp Thành	3267
90711	Xã Hợp Hòa	3267
90710	Xã Hồng Lạc	3267
90709	Xã Hào Phú	3267
90708	Xã Đông Thọ	3267
90707	Xã Đồng Quý	3267
90706	Xã Đông Lợi	3267
90705	Xã Đại Phú	3267
90704	Xã Chi Thiết	3267
90703	Xã Cấp Tiến	3267
90702	Xã Bình Yên	3267
90701	Thị trấn Sơn Dương	3267
800140	Xã Tân Thanh	3267
800139	Xã Trường Sinh	3267
90426	Xã Yên Nguyên	3157
90425	Xã Yên Lập	3157
90424	Xã Xuân Quang	3157
90423	Xã Vinh Quang	3157
90422	Xã Trung Hòa	3157
90421	Xã Trung Hà	3157
90420	Xã Tri Phú	3157
90419	Xã Tân Thịnh	3157
90418	Xã Tân Mỹ	3157
90417	Xã Tân An	3157
90416	Xã Phúc Thịnh	3157
90415	Xã Phúc Sơn	3157
90414	Xã Phú Bình	3157
90413	Xã Nhân Lý	3157
90412	Xã Ngọc Hội	3157
90411	Xã Minh Quang	3157
90410	Xã Linh Phú	3157
90409	Xã Kim Bình	3157
90408	Xã Kiên Đài	3157
90407	Xã Hùng Mỹ	3157
90406	Xã Hòa Phú	3157
90405	Xã Hòa An	3157
90404	Xã Hà Lang	3157
90403	Xã Bình Phú	3157
90402	Xã Bình Nhân	3157
90401	Thị trấn Vĩnh Lộc	3157
90312	Xã Yên Hoa	1982
90311	Xã Thượng Nông	1982
90310	Xã Thượng Giáp	1982
90309	Xã Thanh Tương	1982
90308	Xã Sơn Phú	1982
90307	Xã Sinh Long	1982
90306	Xã Năng Khả	1982
90305	Xã Khau Tinh	1982
90304	Xã Hồng Thái	1982
90303	Xã Đà Vị	1982
90302	Xã Côn Lôn	1982
90301	Thị trấn Nà Hang	1982
90818	Xã Minh Quang	1957
90817	Xã Phúc Sơn	1957
90208	Xã Xuân Lập	1957
90207	Xã Thượng Lâm	1957
90206	Xã Thổ Bình	1957
90205	Xã Phúc Yên	1957
90204	Xã Lăng Can	1957
90203	Xã Khuôn Hà	1957
90202	Xã Hồng Quang	1957
90201	Xã Bình An	1957
90518	Xã Yên Thuận	1941
90517	Xã Yên Phú	1941
90516	Xã Yên Lâm	1941
90515	Xã Thành Long	1941
90514	Xã Thái Sơn	1941
90513	Xã Thái Hòa	1941
90512	Xã Tân Thành	1941
90511	Xã Phù Lưu	1941
90510	Xã Nhân Mục	1941
90509	Xã Minh Khương	1941
90508	Xã Minh Hương	1941
90507	Xã Minh Dân	1941
90506	Xã Hùng Đức	1941
90505	Xã Đức Ninh	1941
90504	Xã Bình Xa	1941
90503	Xã Bằng Cốc	1941
90502	Xã Bạch Xa	1941
90501	Thị trấn Tân Yên	1941
91283	Thị trấn Yên Sơn	1745
90815	Thị Trấn Yên Sơn	1745
90631	Xã Xuân Vân	1745
90630	Xã Tứ Quận	1745
90629	Xã Trung Trực	1745
90628	Xã Trung Sơn	1745
90627	Xã Trung Môn	1745
90626	Xã Trung Minh	1745
90625	Xã Tiến Bộ	1745
90624	Xã Thắng Quân	1745
90623	Xã Thái Bình	1745
90622	Xã Tân Tiến	1745
90621	Xã Tân Long	1745
90620	Xã Quí Quân	1745
90619	Xã Phúc Ninh	1745
90618	Xã Phú Thịnh	1745
90617	Xã Phú Lâm	1745
90616	Xã Nhữ Khê	1745
90615	Xã Nhữ Hán	1745
90614	Xã Mỹ Bằng	1745
90613	Xã Lực Hành	1745
90612	Xã Lang Quán	1745
90611	Xã Kim Quan	1745
90610	Xã Kim Phú	1745
90609	Xã Kiến Thiết	1745
90608	Xã Hùng Lợi	1745
90607	Xã Hoàng Khai	1745
90606	Xã Đội Bình	1745
90605	Xã Đạo Viện	1745
90604	Xã Công Đa	1745
90603	Xã Chiêu Yên	1745
90602	Xã Chân Sơn	1745
90601	Thị trấn Tân Bình	1745
90113	Xã Tràng Đà	1601
90112	Xã Thái Long	1601
90111	Xã Lưỡng Vượng	1601
90110	Xã Đội Cấn	1601
90109	Xã An Tường	1601
90108	Xã An Khang	1601
90107	Phường Ỷ La	1601
90106	Phường Tân Quang	1601
90105	Phường Tân Hà	1601
90104	Phường Phan Thiết	1601
90103	Phường Nông Tiến	1601
90102	Phường Minh Xuân	1601
90101	Phường Hưng Thành	1601
800201	Phường Mỹ Lâm	1601
800200	Xã Kim Phú	1601
50624	Xã Xín Chải	2256
50623	Xã Việt Lâm	2256
50622	Xã Tùng Bá	2256
50621	Xã Trung Thành	2256
50620	Xã Thượng Sơn	2256
50619	Xã Thuận Hoà	2256
50618	Xã Thanh Thủy	2256
50617	Xã Thanh Đức	2256
50616	Xã Quảng Ngần	2256
50615	Xã Phương Tiến	2256
50614	Xã Phú Linh	2256
50613	Xã Phong Quang	2256
50612	Xã Ngọc Minh	2256
50611	Xã Ngọc Linh	2256
50610	Xã Minh Tân	2256
50609	Xã Linh Hồ	2256
50608	Xã Lao Chải	2256
50607	Xã Kim Thạch	2256
50606	Xã Kim Linh	2256
50605	Xã Đạo Đức	2256
50604	Xã Cao Bồ	2256
50603	Xã Bạch Ngọc	2256
50602	Thị trấn Vị Xuyên	2256
50601	Thị trấn Nông Trường Việt Lâm	2256
50713	Xã Yên Phong	2075
50712	Xã Yên Định	2075
50711	Xã Yên Cường	2075
50710	Xã Thượng Tân	2075
50709	Xã Phú Nam	2075
50708	Xã Phiêng Luông	2075
50707	Xã Minh Sơn	2075
50706	Xã Minh Ngọc	2075
50705	Xã Lạc Nông	2075
50704	Xã Giáp Trung	2075
50703	Xã Đường Hồng	2075
50702	Xã Đường Âm	2075
50701	Thị trấn Yên Phú	2075
50418	Xã Thắng Mố	2053
50417	Xã Sủng Tráng	2053
50416	Xã Sủng Thài	2053
50415	Xã Phú Lũng	2053
50414	Xã Ngọc Long	2053
50413	Xã Ngam La	2053
50412	Xã Na Khê	2053
50411	Xã Mậu Long	2053
50410	Xã Mậu Duệ	2053
50409	Xã Lũng Hồ	2053
50408	Xã Lao Và Chải	2053
50407	Xã Hữu Vinh	2053
50406	Xã Đường Thượng	2053
50405	Xã Du Tiến	2053
50404	Xã Du Già	2053
50403	Xã Đông Minh	2053
50402	Xã Bạch Đích	2053
50401	Thị trấn Yên Minh	2053
50919	Xã Xín Mần	2052
50918	Xã Trung Thịnh	2052
50917	Xã Thu Tà	2052
50916	Xã Thèn Phàng	2052
50915	Xã Tả Nhìu	2052
50914	Xã Quảng Nguyên	2052
50913	Xã Pà Vầy Sủ	2052
50912	Xã Ngán Chiên	2052
50911	Xã Nàn Xỉn	2052
50910	Xã Nàn Ma	2052
50909	Xã Nấm Dẩn	2052
50908	Xã Nà Chì	2052
50907	Xã Khuôn Lùng	2052
50906	Xã Cốc Rế	2052
50905	Xã Chí Cà	2052
50904	Xã Chế Là	2052
50903	Xã Bản Ngò	2052
50902	Xã Bản Díu	2052
50901	Thị trấn Cốc Pài	2052
51115	Xã Yên Thành	2001
51114	Xã Yên Hà	2001
51113	Xã Xuân Minh	2001
51112	Xã Xuân Giang	2001
51111	Xã Vĩ Thượng	2001
51110	Xã Tiên Yên	2001
51109	Xã Tiên Nguyên	2001
51108	Xã Tân Trịnh	2001
51107	Xã Tân Nam	2001
51106	Xã Tân Bắc	2001
51105	Xã Nà Khương	2001
51104	Xã Hương Sơn	2001
51103	Xã Bằng Lang	2001
51102	Xã Bản Rịa	2001
51101	Thị trấn Yên Bình	2001
50513	Xã Tùng Vài	1999
50512	Xã Thanh Vân	1999
50511	Xã Thái An	1999
50510	Xã Tả Ván	1999
50509	Xã Quyết Tiến	1999
50508	Xã Quản Bạ	1999
50507	Xã Nghĩa Thuận	1999
50506	Xã Lùng Tám	1999
50505	Xã Đông Hà	1999
50504	Xã Cao Mã Pờ	1999
50503	Xã Cán Tỷ	1999
50502	Xã Bát Đại Sơn	1999
50501	Thị trấn Tam Sơn	1999
50318	Xã Xín Cái	1973
50317	Xã Thượng Phùng	1973
50316	Xã Tát Ngà	1973
50315	Xã Tả Lủng	1973
50314	Xã Sủng Trà	1973
50313	Xã Sủng Máng	1973
50312	Xã Sơn Vĩ	1973
50311	Xã Pải Lủng	1973
50310	Xã Pả Vi	1973
50309	Xã Niêm Tòng	1973
50308	Xã Niêm Sơn	1973
50307	Xã Nậm Ban	1973
50306	Xã Lũng Pù	1973
50305	Xã Lũng Chinh	1973
50304	Xã Khâu Vai	1973
50303	Xã Giàng Chu Phìn	1973
50302	Xã Cán Chu Phìn	1973
50301	Thị trấn Mèo Vạc	1973
50825	Xã Túng Sán	1945
50824	Xã Tụ Nhân	1945
50823	Xã Thông Nguyên	1945
50822	Xã Thèn Chu Phìn	1945
50821	Xã Thàng Tín	1945
50820	Xã Tân Tiến	1945
50819	Xã Tả Sử Choóng	1945
50818	Xã Sán Xả Hồ	1945
50817	Xã Pờ Ly Ngài	1945
50816	Xã Pố Lồ	1945
50815	Xã Ngàm Đăng Vài	1945
50814	Xã Nàng Đôn	1945
50813	Xã Nậm Tỵ	1945
50812	Xã Nam Sơn	1945
50811	Xã Nậm Khòa	1945
50810	Xã Nậm Dịch	1945
50809	Xã Hồ Thầu	1945
50808	Xã Đản Ván	1945
50807	Xã Chiến Phố	1945
50806	Xã Bản Phùng	1945
50805	Xã Bản Péo	1945
50804	Xã Bản Nhùng	1945
50803	Xã Bản Máy	1945
50802	Xã Bản Luốc	1945
50801	Thị trấn Vinh Quang	1945
50219	Xã Sà Phìn	1928
50218	Xã Vần Chải	1928
50217	Xã Thài Phìn Tủng	1928
50216	Xã Tả Phìn	1928
50215	Xã Tả Lủng	1928
50214	Xã Sủng Trái	1928
50213	Xã Sủng Là	1928
50212	Xã Sính Lủng	1928
50211	Xã Sảng Tủng	1928
50210	Xã Phố Là	1928
50209	Xã Phố Cáo	1928
50208	Xã Má Lé	1928
50207	Xã Lũng Thầu	1928
50206	Xã Lũng Táo	1928
50205	Xã Lũng Phìn	1928
50204	Xã Lũng Cú	1928
50203	Xã Hố Quáng Phìn	1928
50202	Thị trấn Phó Bảng	1928
50201	Thị trấn Đồng Văn	1928
51023	Xã Vô Điếm	1893
51022	Xã Vĩnh Phúc	1893
51021	Xã Vĩnh Hảo	1893
51020	Xã Việt Vinh	1893
51019	Xã Việt Hồng	1893
51018	Xã Tiên Kiều	1893
51017	Xã Thượng Bình	1893
51016	Xã Tân Thành	1893
51015	Xã Tân Quang	1893
51014	Xã Tân Lập	1893
51013	Xã Quang Minh	1893
51012	Xã Liên Hiệp	1893
51011	Xã Kim Ngọc	1893
51010	Xã Hữu Sản	1893
51009	Xã Hùng An	1893
51008	Xã Đức Xuân	1893
51007	Xã Đồng Yên	1893
51006	Xã Đồng Tiến	1893
51005	Xã Đông Thành	1893
51004	Xã Đồng Tâm	1893
51003	Xã Bằng Hành	1893
51002	Thị trấn Vĩnh Tuy	1893
51001	Thị trấn Việt Quang	1893
50108	Xã Phương Thiện	1600
50107	Xã Phương Độ	1600
50106	Xã Ngọc Đường	1600
50105	Phường Trần Phú	1600
50104	Phường Quang Trung	1600
50103	Phường Nguyễn Trãi	1600
50102	Phường Ngọc Hà	1600
50101	Phường Minh Khai	1600
91403	Xã Nam Tiến	3281
91402	Xã Ái Quốc	3281
91401	Xã Đông Quang	3281
260735	Xã Vũ Lăng	3281
260734	Xã Vân Trường	3281
260733	Xã Tây Tiến	3281
260732	Xã Tây Sơn	3281
260731	Xã Tây Phong	3281
260730	Xã Tây Ninh	3281
260729	Xã Tây Lương	3281
260728	Xã Tây Giang	3281
260727	Xã Tây An	3281
260726	Xã Phương Công	3281
260725	Xã Nam Trung	3281
260724	Xã Nam Thịnh	3281
260723	Xã Nam Thanh	3281
260722	Xã Nam Thắng	3281
260721	Xã Nam Phú	3281
260720	Xã Nam Hưng	3281
260719	Xã Nam Hồng	3281
260718	Xã Nam Hải	3281
260717	Xã Nam Hà	3281
260716	Xã Nam Cường	3281
260715	Xã Nam Chính	3281
260714	Xã Đông Xuyên	3281
260713	Xã Đông Trung	3281
260712	Xã Đông Trà	3281
260711	Xã Đông Quí	3281
260710	Xã Đông Phong	3281
260709	Xã Đông Minh	3281
260708	Xã Đông Long	3281
260707	Xã Đông Lâm	3281
260706	Xã Đông Hoàng	3281
260705	Xã Đông Hải	3281
260704	Xã Đông Cơ	3281
260703	Xã Bắc Hải	3281
260702	Xã An Ninh	3281
260701	Thị trấn Tiền Hải	3281
91404	Xã Thống Nhất	1951
90838	Xã Hồng Vũ	1951
800281	Xã Minh Quang	1951
800280	Xã Tây Sơn	1951
800279	Thị Trấn Kiến Xương	1951
260637	Xã Vũ Trung	1951
260636	Xã Vũ Thắng	1951
260635	Xã Vũ Tây	1951
260634	Xã Vũ Sơn	1951
260633	Xã Vũ Quí	1951
260632	Xã Vũ Ninh	1951
260631	Xã Vũ Lễ	1951
260630	Xã Vũ Hòa	1951
260629	Xã Vũ Công	1951
260628	Xã Vũ Bình	1951
260627	Xã Vũ An	1951
260626	Xã Trà Giang	1951
260625	Xã Thượng Hiền	1951
260624	Xã Thanh Tân	1951
260623	Xã Quyết Tiến	1951
260622	Xã Quốc Tuấn	1951
260621	Xã Quang Trung	1951
260620	Xã Quang Minh	1951
260619	Xã Quang Lịch	1951
260618	Xã Quang Hưng	1951
260617	Xã Quang Bình	1951
260616	Xã Nam Cao	1951
260615	Xã Nam Bình	1951
260614	Xã Minh Tân	1951
260613	Xã Minh Hưng	1951
260612	Xã Lê Lợi	1951
260611	Xã Hồng Tiến	1951
260610	Xã Hồng Thái	1951
260609	Xã Hòa Bình	1951
260608	Xã Đình Phùng	1951
260607	Xã Bình Thanh	1951
260606	Xã Bình Nguyên	1951
260605	Xã Bình Minh	1951
260604	Xã Bình Định	1951
260603	Xã An Bồi	1951
260602	Xã An Bình	1951
260601	Thị trấn Thanh Nê	1951
800278	Xã Thuần Thành	1869
800277	Xã Tân Học	1869
800276	Xã Sơn Hà	1869
800275	Xã Hòa An	1869
800274	Xã Dương Hồng Thủy	1869
800273	Xã Dương Phúc	1869
800272	Xã An Tân	1869
800271	Xã Hồng Dũng	1869
260848	Xã Thụy Xuân	1869
260847	Xã Thụy Việt	1869
260846	Xã Thụy Văn	1869
260845	Xã Thụy Trường	1869
260844	Xã Thụy Trình	1869
260843	Xã Thụy Thanh	1869
260842	Xã Thụy Tân	1869
260841	Xã Thụy Sơn	1869
260840	Xã Thụy Quỳnh	1869
260839	Xã Thụy Phúc	1869
260838	Xã Thụy Phong	1869
260837	Xã Thụy Ninh	1869
260836	Xã Thụy Lương	1869
260835	Xã Thụy Liên	1869
260834	Xã Thụy Hưng	1869
260833	Xã Thụy Hồng	1869
260832	Xã Thụy Hải	1869
260831	Xã Thụy Hà	1869
260830	Xã Thụy Duyên	1869
260829	Xã Thụy Dương	1869
260828	Xã Thụy Dũng	1869
260827	Xã Thụy Dân	1869
260826	Xã Thụy Chính	1869
260825	Xã Thụy Bình	1869
260824	Xã Thụy An	1869
260823	Xã Thái Xuyên	1869
260822	Xã Thái Thủy	1869
260821	Xã Thái Thượng	1869
260820	Xã Thái Thuần	1869
260819	Xã Thái Thọ	1869
260818	Xã Thái Thịnh	1869
260817	Xã Thái Thành	1869
260816	Xã Thái Tân	1869
260815	Xã Thái Sơn	1869
260814	Xã Thái Phúc	1869
260813	Xã Thái Nguyên	1869
260812	Xã Thái Hưng	1869
260811	Xã Thái Hồng	1869
260810	Xã Thái Học	1869
260809	Xã Thái Hòa	1869
260808	Xã Thái Hà	1869
260807	Xã Thái Giang	1869
260806	Xã Thái Dương	1869
260805	Xã Thái Đô	1869
260804	Xã Thái An	1869
260803	Xã Hồng Quỳnh	1869
260802	Xã  Mỹ Lộc	1869
260801	Thị trấn Diêm Điền	1869
91396	Xã Trang Bảo Xá	1868
800265	Xã Châu Sơn	1868
260238	Xã Quỳnh Xá	1868
260237	Xã Quỳnh Trang	1868
260236	Xã Quỳnh Thọ	1868
260235	Xã Quỳnh Sơn	1868
260234	Xã Quỳnh Nguyên	1868
260233	Xã Quỳnh Ngọc	1868
260232	Xã Quỳnh Mỹ	1868
260231	Xã Quỳnh Minh	1868
260230	Xã Quỳnh Lâm	1868
260229	Xã Quỳnh Khê	1868
260228	Xã Quỳnh Hưng	1868
260227	Xã Quỳnh Hồng	1868
260226	Xã Quỳnh Hội	1868
260225	Xã Quỳnh Hoàng	1868
260224	Xã Quỳnh Hoa	1868
260223	Xã Quỳnh Hải	1868
260222	Xã Quỳnh Giao	1868
260221	Xã Quỳnh Châu	1868
260220	Xã Quỳnh Bảo	1868
260219	Xã Đồng Tiến	1868
260218	Xã Đông Hải	1868
260217	Xã An Vũ	1868
260216	Xã An Vinh	1868
260215	Xã An Tràng	1868
260214	Xã An Thanh	1868
260213	Xã An Thái	1868
260212	Xã An Quí	1868
260211	Xã An Ninh	1868
260210	Xã An Mỹ	1868
260209	Xã An Lễ	1868
260208	Xã An Khê	1868
260207	Xã An Hiệp	1868
260206	Xã An Dục	1868
260205	Xã An Đồng	1868
260204	Xã An Cầu	1868
260203	Xã An Ấp	1868
260202	Thị trấn Quỳnh Côi	1868
260201	Thị trấn An Bài	1868
91397	Xã Quang Trung	1867
260335	Xã Văn Lang	1867
260334	Xã Văn Cẩm	1867
260333	Xã Tiến Đức	1867
260332	Xã Thống Nhất	1867
260331	Xã Thái Phương	1867
260330	Xã Thái Hưng	1867
260329	Xã Tây Đô	1867
260328	Xã Tân Tiến	1867
260327	Xã Tân Lễ	1867
260326	Xã Tân Hòa	1867
260325	Xã Phúc Khánh	1867
260324	Xã Minh Tân	1867
260323	Xã Minh Khai	1867
260322	Xã Minh Hòa	1867
260321	Xã Liên Hiệp	1867
260320	Xã Kim Trung	1867
260319	Xã Hùng Dũng	1867
260318	Xã Hồng Minh	1867
260317	Xã Hồng Lĩnh	1867
260316	Xã Hồng An	1867
260315	Xã Hòa Tiến	1867
260314	Xã Hòa Bình	1867
260313	Xã Duyên Hải	1867
260312	Xã Đông Đô	1867
260311	Xã Độc Lập	1867
260310	Xã Đoan Hùng	1867
260309	Xã Điệp Nông	1867
260308	Xã Dân Chủ	1867
260307	Xã Cộng Hòa	1867
260306	Xã Chi Lăng	1867
260305	Xã Chí Hòa	1867
260304	Xã Canh Tân	1867
260303	Xã Bắc Sơn	1867
260302	Thị trấn Hưng Nhân	1867
260301	Thị trấn Hưng Hà	1867
260530	Xã Xuân Hòa	1716
260529	Xã Vũ Vinh	1716
260528	Xã Vũ Vân	1716
260527	Xã Vũ Tiến	1716
260526	Xã Vũ Hội	1716
260525	Xã Vũ Đoài	1716
260524	Xã Việt Thuận	1716
260523	Xã Việt Hùng	1716
260522	Xã Tự Tân	1716
260521	Xã Trung An	1716
260520	Xã Tân Phong	1716
260519	Xã Tân Lập	1716
260518	Xã Tân Hòa	1716
260517	Xã Tam Quang	1716
260516	Xã Song Lãng	1716
260515	Xã Song An	1716
260514	Xã Phúc Thành	1716
260513	Xã Nguyên Xá	1716
260512	Xã Minh Quang	1716
260511	Xã Minh Lãng	1716
260510	Xã Minh Khai	1716
260509	Xã Hồng Phong	1716
260508	Xã Hồng Lý	1716
260507	Xã Hòa Bình	1716
260506	Xã Hiệp Hòa	1716
260505	Xã Duy Nhất	1716
260504	Xã Dũng Nghĩa	1716
260503	Xã Đồng Thanh	1716
260502	Xã Bách Thuận	1716
260501	Thị trấn Vũ Thư	1716
91400	Xã Xuân Quang Động	1715
91399	Xã Phong Dương Tiến	1715
91398	Xã Liên An Đô	1715
800270	Xã Minh Phú	1715
800269	Xã Đông Quan	1715
800268	Xã Hồng Bạch	1715
800267	Xã Liên Hoa	1715
800266	Xã Hà Giang	1715
260444	Xã Trọng Quan	1715
260443	Xã Thăng Long	1715
260442	Xã Phú Lương	1715
260441	Xã Phú Châu	1715
260440	Xã Phong Châu	1715
260439	Xã Nguyên Xá	1715
260438	Xã Minh Tân	1715
260437	Xã Minh Châu	1715
260436	Xã Mê Linh	1715
260435	Xã Lô Giang	1715
260434	Xã Liên Giang	1715
260433	Xã Hợp Tiến	1715
260432	Xã Hồng Việt	1715
260431	Xã Hồng Giang	1715
260430	Xã Hồng Châu	1715
260429	Xã Hoa Nam	1715
260428	Xã Hoa Lư	1715
260427	Xã Đông Xuân	1715
260426	Xã Đông Xá	1715
260425	Xã Đông Vinh	1715
260424	Xã Đông Tân	1715
260423	Xã Đông Sơn	1715
260422	Xã Đông Quang	1715
260421	Xã Đông Phương	1715
260420	Xã Đồng Phú	1715
260419	Xã Đông Phong	1715
260418	Xã Đông Lĩnh	1715
260417	Xã Đông La	1715
260416	Xã Đông Kinh	1715
260415	Xã Đông Huy	1715
260414	Xã Đông Hợp	1715
260413	Xã Đông Hoàng	1715
260412	Xã Đông Hà	1715
260411	Xã Đông Giang	1715
260410	Xã Đông Dương	1715
260409	Xã Đông Động	1715
260408	Xã Đông Cường	1715
260407	Xã Đông Các	1715
260406	Xã Đông Á	1715
260405	Xã Đô Lương	1715
260404	Xã Chương Dương	1715
260403	Xã Bạch Đằng	1715
260402	Xã An Châu	1715
260401	Thị trấn Đông Hưng	1715
260119	Xã Vũ Phúc	1599
260118	Xã Vũ Lạc	1599
260117	Xã Vũ Đông	1599
260116	Xã Vũ Chính	1599
260115	Xã Tân Bình	1599
260114	Xã Phú Xuân	1599
260113	Xã Đông Thọ	1599
260112	Xã Đông Mỹ	1599
260111	Xã Đông Hòa	1599
260110	Phường Trần Lãm	1599
260109	Phường Trần Hưng Đạo	1599
260108	Phường Tiền Phong	1599
260107	Phường Quang Trung	1599
260106	Phường Phú Khánh	1599
260105	Phường Lê Hồng Phong	1599
260104	Phường Kỳ Bá	1599
260103	Phường Hoàng Diệu	1599
260102	Phường Đề Thám	1599
260101	Phường Bồ Xuyên	1599
800066	Xã Hồng Phong	3294
210719	Xã Tứ Cường	3294
210718	Xã Tiền Phong	3294
210717	Xã Thanh Tùng	3294
210716	Xã Thanh Giang	3294
210715	Xã Tân Trào	3294
210714	Xã Phạm Kha	3294
210713	Xã Ngũ Hùng	3294
210712	Xã Ngô Quyền	3294
210711	Xã Lê Hồng	3294
210710	Xã Lam Sơn	3294
210709	Xã Hùng Sơn	3294
210708	Xã Hồng Quang	3294
210707	Xã Đoàn Tùng	3294
210706	Xã Đoàn Kết	3294
210705	Xã Diên Hồng	3294
210704	Xã Chi Lăng Nam	3294
210703	Xã Chi Lăng Bắc	3294
210702	Xã Cao Thắng	3294
210701	Thị trấn Thanh Miện	3294
91355	Xã Vĩnh Cường	3292
91354	Xã Thanh Tân	3292
91353	Xã Cẩm Việt	3292
800065	Xã Thanh Quang	3292
800064	Xã An Phượng	3292
211025	Xã Vĩnh Lập	3292
211024	Xã Việt Hồng	3292
211023	Xã Trường Thành	3292
211022	Xã Tiền Tiến	3292
211021	Xã Thanh Xuân	3292
211020	Xã Thanh Xá	3292
211019	Xã Thanh Thủy	3292
211018	Xã Thanh Sơn	3292
211017	Xã Thanh Lang	3292
211016	Xã Thanh Khê	3292
211015	Xã Thanh Hồng	3292
211014	Xã Thanh Hải	3292
211013	Xã Thanh Cường	3292
211012	Xã Thanh Bính	3292
211011	Xã Thanh An	3292
211010	Xã Tân Việt	3292
211009	Xã Tân An	3292
211008	Xã Quyết Thắng	3292
211007	Xã Phượng Hoàng	3292
211006	Xã Liên Mạc	3292
211005	Xã Hợp Đức	3292
211004	Xã Hồng Lạc	3292
211003	Xã Cẩm Chế	3292
211002	Xã An Lương	3292
211001	Thị trấn Thanh Hà	3292
91363	Xã Lạc Phượng	3287
91362	Xã Dân An	3287
800068	Xã Đại Sơn	3287
800067	Xã Chí Minh	3287
210627	Xã Văn Tố	3287
210626	Xã Tứ Xuyên	3287
210625	Xã Tiên Động	3287
210624	Xã Tây Kỳ	3287
210623	Xã Tân Kỳ	3287
210622	Xã Tái Sơn	3287
210621	Xã Quang Trung	3287
210620	Xã Quang Phục	3287
210619	Xã Quảng Nghiệp	3287
210618	Xã Quang Khải	3287
210617	Xã Phượng Kỳ	3287
210616	Xã Nguyên Giáp	3287
210615	Xã Ngọc Sơn	3287
210614	Xã Ngọc Kỳ	3287
210613	Xã Minh Đức	3287
210612	Xã Kỳ Sơn	3287
210611	Xã Hưng Đạo	3287
210610	Xã Hà Thanh	3287
210609	Xã Hà Kỳ	3287
210608	Xã Đông Kỳ	3287
210607	Xã Dân Chủ	3287
210606	Xã Đại Hợp	3287
210605	Xã Đại Đồng	3287
210604	Xã Cộng Lạc	3287
210603	Xã Bình Lăng	3287
210602	Xã An Thanh	3287
210601	Thị trấn Tứ Kỳ	3287
91365	Xã Kiến Phúc	3238
91364	Xã Bình Xuyên	3238
90843	Xã Đức Phúc	3238
210828	Xã Vĩnh Hòa	3238
210827	Xã Vạn Phúc	3238
210826	Xã Văn Hội	3238
210825	Xã Văn Giang	3238
210824	Xã Ứng Hoè	3238
210823	Xã Tân Quang	3238
210822	Xã Tân Phong	3238
210821	Xã Tân Hương	3238
210820	Xã Quyết Thắng	3238
210819	Xã Quang Hưng	3238
210818	Xã Ninh Thành	3238
210817	Xã Ninh Hòa	3238
210816	Xã Ninh Hải	3238
210815	Xã Nghĩa An	3238
210814	Xã Kiến Quốc	3238
210813	Xã Hưng Thái	3238
210812	Xã Hưng Long	3238
210811	Xã Hồng Thái	3238
210810	Xã Hồng Phúc	3238
210809	Xã Hồng Phong	3238
210808	Xã Hồng Đức	3238
210807	Xã Hồng Dụ	3238
210806	Xã Hoàng Hanh	3238
210805	Xã Hiệp Lực	3238
210804	Xã Đông Xuyên	3238
210803	Xã Đồng Tâm	3238
210802	Xã An Đức	3238
210801	Thị trấn Ninh Giang	3238
210220	Xã Văn Đức	2056
210219	Xã Tân Dân	2056
210218	Xã Nhân Huệ	2056
210217	Xã Lê Lợi	2056
210216	Xã Kênh Giang	2056
210215	Xã Hưng Đạo	2056
210214	Xã Hoàng Tiến	2056
210213	Xã Hoàng Hoa Thám	2056
210212	Xã Đồng Lạc	2056
210211	Xã Cổ Thành	2056
210210	Xã Bắc An	2056
210209	Xã An Lạc	2056
210208	Phường Văn An	2056
210207	Phường Thái Học	2056
210206	Phường Sao Đỏ	2056
210205	Phường Phả Lại	2056
210204	Phường Hoàng Tân	2056
210203	Phường Cộng Hoà	2056
210202	Phường Chí Minh	2056
210201	Phường Bến Tắm	2056
91352	Xã Hòa Bình	1953
91351	Xã Vũ Dũng	1953
91350	Xã Lai Khê	1953
800063	Xã Đồng Cẩm	1953
800062	Xã Tuấn Việt	1953
800061	Xã Kim Liên	1953
211121	Xã Việt Hưng	1953
211120	Xã Tuấn Hưng	1953
211119	Xã Thượng Vũ	1953
211118	Xã Tam Kỳ	1953
211117	Xã Phúc Thành A	1953
211116	Xã Ngũ Phúc	1953
211115	Xã Liên Hòa	1953
211114	Xã Lai Vu	1953
211113	Xã Kim Xuyên	1953
211112	Xã Kim Tân	1953
211111	Xã Kim Lương	1953
211110	Xã Kim Khê	1953
211109	Xã Kim Đính	1953
211108	Xã Kim Anh	1953
211107	Xã Đồng Gia	1953
211106	Xã Đại Đức	1953
211105	Xã Cộng Hòa	1953
211104	Xã Cổ Dũng	1953
211103	Xã Cẩm La	1953
211102	Xã Bình Dân	1953
211101	Thị trấn Phú Thái	1953
91361	Xã Quang Đức	1934
91360	Xã Nhật Quang	1934
91359	Xã Gia Tiến	1934
91358	Xã Gia Phúc	1934
210523	Xã Yết Kiêu	1934
210522	Xã Trùng Khánh	1934
210521	Xã Toàn Thắng	1934
210520	Xã Thống Nhất	1934
210519	Xã Thống Kênh	1934
210518	Xã Tân Tiến	1934
210517	Xã Quang Minh	1934
210516	Xã Phương Hưng	1934
210515	Xã Phạm Trấn	1934
210514	Xã Nhật Tân	1934
210513	Xã Liên Hồng	1934
210512	Xã Lê Lợi	1934
210511	Xã Hồng Hưng	1934
210510	Xã Hoàng Diệu	1934
210509	Xã Gia Xuyên	1934
210508	Xã Gia Tân	1934
210507	Xã Gia Lương	1934
210506	Xã Gia Khánh	1934
210505	Xã Gia Hòa	1934
210504	Xã Đức Xương	1934
210503	Xã Đồng Quang	1934
210502	Xã Đoàn Thượng	1934
210501	Thị trấn Gia Lộc	1934
800169	Xã Quang Thành	1818
800158	Phường Phạm Thái	1818
800157	Phường An Lưu	1818
210425	Xã Thượng Quận	1818
210424	Xã Thất Hùng	1818
210423	Xã Thăng Long	1818
210422	Xã Thái Thịnh	1818
210421	Xã Thái Sơn	1818
210420	Xã Tân Dân	1818
210419	Xã Quang Trung	1818
210418	Xã Phúc Thành B	1818
210417	Xã Phạm Mệnh	1818
210416	Xã Minh Hòa	1818
210415	Xã Long Xuyên	1818
210414	Xã Lê Ninh	1818
210413	Xã Lạc Long	1818
210412	Xã Hoành Sơn	1818
210411	Xã Hiệp Sơn	1818
210410	Xã Hiệp Hòa	1818
210409	Xã Hiệp An	1818
210408	Xã Hiến Thành	1818
210407	Xã Duy Tân	1818
210406	Xã Bạch Đằng	1818
210405	Xã An Sinh	1818
210404	Xã An Phụ	1818
210403	Thị trấn Phú Thứ	1818
210402	Phường Minh Tân	1818
210401	Thị trấn Kinh Môn	1818
91356	Xã Phúc Điền	1817
800060	Xã Định Sơn	1817
210919	Xã Thạch Lỗi	1817
210918	Xã Tân Trường	1817
210917	Xã Ngọc Liên	1817
210916	Xã Lương Điền	1817
210915	Xã Kim Giang	1817
210914	Xã Đức Chính	1817
210913	Xã Cao An	1817
210912	Xã Cẩm Vũ	1817
210911	Xã Cẩm Văn	1817
210910	Xã Cẩm Sơn	1817
210909	Xã Cẩm Phúc	1817
210908	Xã Cẩm Hưng	1817
210907	Xã Cẩm Hoàng	1817
210906	Xã Cẩm Đông	1817
210905	Xã Cẩm Đoài	1817
210904	Xã Cẩm Định	1817
210903	Xã Cẩm Điền	1817
210902	Thị trấn Lai Cách	1817
210901	Thị trấn Cẩm Giang	1817
91357	Xã Thái Minh	1816
800059	Xã Vĩnh Hưng	1816
211218	Xã Vĩnh Tuy	1816
211217	Xã Vĩnh Hồng	1816
211216	Xã Tráng Liệt	1816
211215	Xã Thúc Kháng	1816
211214	Xã Thái Học	1816
211213	Xã Thái Hòa	1816
211212	Xã Thái Dương	1816
211211	Xã Tân Việt	1816
211210	Xã Tân Hồng	1816
211209	Xã Nhân Quyền	1816
211208	Xã Long Xuyên	1816
211207	Xã Hưng Thịnh	1816
211206	Xã Hùng Thắng	1816
211205	Xã Hồng Khê	1816
211204	Xã Cổ Bi	1816
211203	Xã Bình Xuyên	1816
211202	Xã Bình Minh	1816
211201	Thị trấn Kẻ Sặt	1816
91349	Xã An Phú	1727
91348	Xã Trần Phú	1727
210319	Xã Thanh Quang	1727
210318	Xã Thái Tân	1727
210317	Xã Quốc Tuấn	1727
210316	Xã Phú Điền	1727
210315	Xã Nam Trung	1727
210314	Xã Nam Tân	1727
210313	Xã Nam Hưng	1727
210312	Xã Nam Hồng	1727
210311	Xã Nam Chính	1727
210310	Xã Minh Tân	1727
210309	Xã Hợp Tiến	1727
210308	Xã Hồng Phong	1727
210307	Xã Hiệp Cát	1727
210306	Xã Đồng Lạc	1727
210305	Xã Cộng Hòa	1727
210304	Xã An Sơn	1727
210303	Xã An Lâm	1727
210302	Xã An Bình	1727
210301	Thị trấn Nam Sách	1727
800184	Xã Tiền Tiến	1598
800183	Xã Quyết Thắng	1598
800182	Xã Ngọc Sơn	1598
800181	Xã Liên Hồng	1598
800180	Xã Gia Xuyên	1598
800179	Xã An Thượng	1598
210121	Xã Thượng Đạt	1598
210120	Xã Tân Hưng	1598
210119	Xã Nam Đồng	1598
210118	Xã An Châu	1598
210117	Phường Việt Hoà	1598
210116	Phường Tứ Minh	1598
210115	Phường Trần Phú	1598
210114	Phường Trần Hưng Đạo	1598
210113	Phường Thanh Bình	1598
210112	Phường Thạch Khôi	1598
210111	Phường Tân Bình	1598
210110	Phường Quang Trung	1598
210109	Phường Phạm Ngũ Lão	1598
210108	Phường Nhị Châu	1598
210107	Phường Nguyễn Trãi	1598
210106	Phường Ngọc Châu	1598
210105	Phường Lê Thanh Nghị	1598
210104	Phường Hải Tân	1598
210103	Phường Cẩm Thượng	1598
210102	Phường Bình Hàn	1598
210101	Phường Ái Quốc	1598
91381	Xã Kiến Hưng	3203
30818	Xã Tú Sơn	3203
30817	Xã Thuỵ Hương	3203
30816	Xã Thuận Thiên	3203
30815	Xã Thanh Sơn	3203
30814	Xã Tân Trào	3203
30813	Xã Tân Phong	3203
30812	Xã Ngũ Phúc	3203
30811	Xã Ngũ Đoan	3203
30810	Xã Minh Tân	3203
30809	Xã Kiến Quốc	3203
30808	Xã Hữu Bằng	3203
30807	Xã Du Lễ	3203
30806	Xã Đông Phương	3203
30805	Xã Đoàn Xá	3203
30804	Xã Đại Hợp	3203
30803	Xã Đại Hà	3203
30802	Xã Đại Đồng	3203
30801	Thị trấn Núi Đối	3203
31312	Xã Xuân Đám	2108
31311	Xã Việt Hải	2108
31310	Xã Văn Phong	2108
31309	Xã Trân Châu	2108
31308	Xã Phù Long	2108
31307	Xã Nghĩa Lộ	2108
31306	Xã Hoàng Châu	2108
31305	Xã Hiền Hào	2108
31304	Xã Gia Luận	2108
31303	Xã Đồng Bài	2108
31302	Thị trấn Cát Hải	2108
31301	Thị trấn Cát Bà	2108
90836	Bạch Long Vĩ	2107
91385	Xã Vĩnh Hải	1822
91384	Xã Vĩnh Hưng	1822
91383	Xã Vĩnh Hoà	1822
31230	Xã Vĩnh Tiến	1822
31229	Xã Vinh Quang	1822
31228	Xã Vĩnh Phong	1822
31227	Xã Vĩnh Long	1822
31226	Xã Vĩnh An	1822
31225	Xã Việt Tiến	1822
31224	Xã Trung Lập	1822
31223	Xã Trấn Dương	1822
31222	Xã Tiền Phong	1822
31221	Xã Thanh Lương	1822
31220	Xã Thắng Thuỷ	1822
31219	Xã Tân Liên	1822
31218	Xã Tân Hưng	1822
31217	Xã Tam Đa	1822
31216	Xã Tam Cường	1822
31215	Xã Nhân Hoà	1822
31214	Xã Lý Học	1822
31213	Xã Liên Am	1822
31212	Xã Hùng Tiến	1822
31211	Xã Hưng Nhân	1822
31210	Xã Hoà Bình	1822
31209	Xã Hiệp Hoà	1822
31208	Xã Giang Biên	1822
31207	Xã Dũng Tiến	1822
31206	Xã Đồng Minh	1822
31205	Xã Cộng Hiền	1822
31204	Xã Cổ Am	1822
31203	Xã Cao Minh	1822
31202	Xã An Hoà	1822
31201	Thị trấn Vĩnh Bảo	1822
91382	Xã Tân Minh	1821
31123	Xã Vinh Quang	1821
31122	Xã Tự Cường	1821
31121	Xã Toàn Thắng	1821
31120	Xã Tiên Tiến	1821
31119	Xã Tiên Thanh	1821
31118	Xã Tiên Thắng	1821
31117	Xã Tiên Minh	1821
31116	Xã Tiên Hưng	1821
31115	Xã Tiên Cường	1821
31114	Xã Tây Hưng	1821
31113	Xã Quyết Tiến	1821
31112	Xã Quang Phục	1821
31111	Xã Nam Hưng	1821
31110	Xã Kiến Thiết	1821
31109	Xã Khởi Nghĩa	1821
31108	Xã Hùng Thắng	1821
31107	Xã Đông Hưng	1821
31106	Xã Đoàn Lập	1821
31105	Xã Đại Thắng	1821
31104	Xã Cấp Tiến	1821
31103	Xã Bạch Đằng	1821
31102	Xã Bắc Hưng	1821
31101	Thị trấn Tiên Lãng	1821
03079	Xã Mỹ Đức	1820
03078	Xã Chiến Thắng	1820
03077	Xã Bát Trang	1820
03076	Xã An Tiến	1820
03075	Xã An Thọ	1820
03074	Xã An Thắng	1820
03073	Xã An Thái	1820
03072	Thị trấn Trường Sơn	1820
030717	Xã Trường Thọ	1820
030716	Xã Trường Thành	1820
030715	Xã Thái Sơn	1820
030714	Xã Tân Viên	1820
030713	Xã Tân Dân	1820
030712	Xã Quốc Tuấn	1820
030711	Xã Quang Trung	1820
030710	Xã Quang Hưng	1820
03071	Thị trấn An Lão	1820
91380	Phường An Hải	1819
31016	Xã Tân Tiến	1819
31015	Xã Quốc Tuấn	1819
31014	Xã Nam Sơn	1819
31013	Xã Lê Thiện	1819
31012	Xã Lê Lợi	1819
31011	Xã Hồng Thái	1819
31010	Xã Hồng Phong	1819
31009	Xã Đồng Thái	1819
31008	Xã Đặng Cương	1819
31007	Xã Đại Bản	1819
31006	Xã Bắc Sơn	1819
31005	Xã An Hưng	1819
31004	Xã An Hồng	1819
31003	Xã An Hoà	1819
31002	Xã An Đồng	1819
31001	Thị trấn An Dương	1819
91379	Phường Hoàng Lâm	1726
91378	Phường Nam Triệu Giang	1726
91377	Phường Phạm Ngũ Lão	1726
91376	Phường Thủy Hà	1726
91375	Phường Lê Hồng Phong	1726
91374	Xã Quang Trung	1726
91373	Phường Trần Hưng Đạo	1726
91372	Xã Ninh Sơn	1726
91371	Xã Bạch Đằng	1726
91370	Xã Liên Xuân	1726
30937	Xã Trung Hà	1726
30936	Xã Thuỷ Triều	1726
30935	Xã Thuỷ Sơn	1726
30934	Xã Thuỷ Đường	1726
30933	Xã Thiên Hương	1726
30932	Xã Tân Dương	1726
30931	Xã Tam Hưng	1726
30930	Xã Quảng Thanh	1726
30929	Xã Phục Lễ	1726
30928	Xã Phù Ninh	1726
30927	Xã Phả Lễ	1726
30926	Xã Ngũ Lão	1726
30925	Xã Mỹ Đồng	1726
30924	Xã Minh Tân	1726
30923	Xã Lưu Kỳ	1726
30922	Xã Lưu Kiếm	1726
30921	Xã Liên Khê	1726
30920	Xã Lập Lễ	1726
30919	Xã Lâm Động	1726
30918	Xã Lại Xuân	1726
30917	Xã Kỳ Sơn	1726
30916	Xã Kiền Bái	1726
30915	Xã Kênh Giang	1726
30914	Xã Hợp Thành	1726
30913	Xã Hoàng Động	1726
30912	Xã Hoa Động	1726
30911	Xã Hoà Bình	1726
30910	Xã Gia Minh	1726
30909	Xã Gia Đức	1726
30908	Xã Dương Quan	1726
30907	Xã Đông Sơn	1726
30906	Xã Chính Mỹ	1726
30905	Xã Cao Nhân	1726
30904	Xã An Sơn	1726
30903	Xã An Lư	1726
30902	Thị trấn Núi Đèo	1726
30901	Thị trấn Minh Đức	1726
800264	Phường Hải Sơn	1707
30607	Phường Vạn Sơn	1707
30606	Phường Vạn Hương	1707
30605	Phường Ngọc Xuyên	1707
30604	Phường Ngọc Hải	1707
30603	Phường Minh Đức	1707
30602	Phường Hợp Đức	1707
30601	Phường Bàng La	1707
31506	Phường Tân Thành	1706
31505	Phường Hưng Đạo	1706
31504	Phường Hoà Nghĩa	1706
31503	Phường Hải Thành	1706
31502	Phường Đa Phúc	1706
31501	Phường Anh Dũng	1706
30508	Phường Tràng Cát	1591
30507	Phường Thành Tô	1591
30506	Phường Nam Hải	1591
30505	Phường Đông Hải 2	1591
30504	Phường Đông Hải 1	1591
30503	Phường Đằng Lâm	1591
30502	Phường Đằng Hải	1591
30501	Phường Cát Bi	1591
91369	Phường Bắc Hà	1590
30410	Phường Văn Đẩu	1590
30409	Phường Tràng Minh	1590
30408	Phường Trần Thành Ngọ	1590
30407	Phường Quán Trữ	1590
30406	Phường Phù Liễn	1590
30405	Phường Ngọc Sơn	1590
30404	Phường Nam Sơn	1590
30403	Phường Lãm Hà	1590
30402	Phường Đồng Hoà	1590
30401	Phường Bắc Sơn	1590
91368	Phường An Hồng	1589
91367	Phường An Hưng	1589
91366	Phường Đại Bản	1589
30111	Phường Trại Chuối	1589
30110	Phường Thượng Lý	1589
30109	Phường Sở Dầu	1589
30108	Phường Quang Trung	1589
30107	Phường Quán Toan	1589
30106	Phường Phan Bội Châu	1589
30105	Phường Phạm Hồng Thái	1589
30104	Phường Minh Khai	1589
30103	Phường Hùng Vương	1589
30102	Phường Hoàng Văn Thụ	1589
30101	Phường Hạ Lý	1589
30215	Phường Vĩnh Niệm	1588
30214	Phường Trần Nguyên Hãn	1588
30213	Phường Trại Cau	1588
30212	Phường Niệm Nghĩa	1588
30211	Phường Nghĩa Xá	1588
30210	Phường Lam Sơn	1588
30209	Phường Kênh Dương	1588
30208	Phường Hồ Nam	1588
30207	Phường Hàng Kênh	1588
30206	Phường Dư Hàng Kênh	1588
30205	Phường Dư Hàng	1588
30204	Phường Đông Hải	1588
30203	Phường Cát Dài	1588
30202	Phường An Dương	1588
30201	Phường An Biên	1588
30313	Phường Vạn Mỹ	1587
30312	Phường Máy Tơ	1587
30311	Phường Máy Chai	1587
30310	Phường Lương Khánh Thiện	1587
30309	Phường Lê Lợi	1587
30308	Phường Lạch Tray	1587
30307	Phường Lạc Viên	1587
30306	Phường Gia Viên	1587
30305	Phường Đổng Quốc Bình	1587
30304	Phường Đông Khê	1587
30303	Phường Đằng Giang	1587
30302	Phường Cầu Tre	1587
30301	Phường Cầu Đất	1587
91566	Phường Long Hồ	3703
91565	Phường Hương An	3703
91564	Phường Hương Vinh	3703
91563	Phường Hương Long	3703
91562	Phường Hương Sơ	3703
91561	Phường An Hòa	3703
91560	Phường Kim Long	3703
91559	Phường Đông Ba	3703
91558	Phường Thuận Hòa	3703
91557	Phường Phú Hậu	3703
91556	Phường Gia Hội	3703
91555	Phường Thuận Lộc	3703
91554	Phường Tây Lộc	3703
91553	Phường Hương Phong	3702
91552	Phường Thủy Bằng	3702
91551	Phường Thủy Vân	3702
91550	Phường Phú Thượng	3702
91549	Phường Dương Nỗ	3702
91548	Phường Thuận An	3702
91547	Phường An Tây	3702
91546	Phường An Đông	3702
91545	Phường Thuỷ Xuân	3702
91544	Phường Thuỷ Biều	3702
91543	Phường An Cựu	3702
91542	Phường Phước Vĩnh	3702
91541	Phường Trường An	3702
91540	Phường Xuân Phú	3702
91539	Phường Phú Nhuận	3702
91538	Phường Phú Hội	3702
91537	Phường Vĩnh Ninh	3702
91536	Phường Phường Đúc	3702
91535	Phường Vỹ Dạ	3702
330311	Xã Quảng Vinh	3257
330310	Xã Quảng Thọ	3257
330309	Xã Quảng Thành	3257
330308	Xã Quảng Thái	3257
330307	Xã Quảng Phước	3257
330306	Xã Quảng Phú	3257
330305	Xã Quảng Ngạn	3257
330304	Xã Quảng Lợi	3257
330303	Xã Quảng Công	3257
330302	Xã Quảng An	3257
330301	Thị trấn Sịa	3257
800136	Xã Hương Xuân	3234
330811	Xã Thượng Quảng	3234
330810	Xã Thượng Nhật	3234
330809	Xã Thượng Long	3234
330808	Xã Thượng Lộ	3234
330807	Xã Hương Sơn	3234
330806	Xã Hương Phú	3234
330805	Xã Hương Lộc	3234
330804	Xã Hương Hữu	3234
330803	Xã Hương Hòa	3234
330802	Xã Hương Giang	3234
330801	Thị trấn Khe Tre	3234
91568	Phường Phong Phú	2193
91567	Xã Phong Thạnh	2193
33029	Xã Phong Chương	2193
33028	Xã Phong Bình	2193
33027	Xã Phong An	2193
33026	Xã Điền Môn	2193
33025	Xã Điền Lộc	2193
33024	Xã Điền Hương	2193
33023	Xã Điền Hòa	2193
33022	Xã Điền Hải	2193
330216	Xã Phong Xuân	2193
330215	Xã Phong Thu	2193
330214	Xã Phong Sơn	2193
330213	Xã Phong Mỹ	2193
330212	Xã Phong Hòa	2193
330211	Xã Phong Hiền	2193
330210	Xã Phong Hải	2193
33021	Thị trấn Phong Điền	2193
800153	Xã Lâm Đớt	1885
800135	Xã Trung Sơn	1885
800134	Xã Quảng Nhâm	1885
330921	Xã Sơn Thủy	1885
330920	Xã Phú Vinh	1885
330919	Xã Nhâm	1885
330918	Xã Hương Phong	1885
330917	Xã Hương Nguyên	1885
330916	Xã Hương Lâm	1885
330915	Xã Hồng Vân	1885
330914	Xã Hồng Trung	1885
330913	Xã Hồng Thủy	1885
330912	Xã Hồng Thượng	1885
330911	Xã Hồng Thái	1885
330910	Xã Hồng Quảng	1885
330909	Xã Hồng Kim	1885
330908	Xã Hồng Hạ	1885
330907	Xã Hồng Bắc	1885
330906	Xã Đông Sơn	1885
330905	Xã Bắc Sơn	1885
330904	Xã A Roằng	1885
330903	Xã A Ngo	1885
330902	Xã A Đớt	1885
330901	Thị trấn A Lưới	1885
91631	Xã Hương Hòa	1882
91578	Xã Thượng Nhật	1882
91577	Xã Thượng Long	1882
91576	Xã Thượng Lộ	1882
91575	Xã Hương Hữu	1882
91574	Xã Hương Xuân	1882
91573	Xã Thượng Quảng	1882
91572	Xã Hương Lộc	1882
91571	Xã Hương Sơn	1882
91570	Xã Hương Phú	1882
91569	Thị trấn Khe Tre	1882
800137	Xã Giang Hải	1882
330718	Xã Xuân Lộc	1882
330717	Xã Vinh Mỹ	1882
330716	Xã Vinh Hưng	1882
330715	Xã Vinh Hiền	1882
330714	Xã Vinh Hải	1882
330713	Xã Vinh Giang	1882
330712	Xã Lộc Vĩnh	1882
330711	Xã Lộc Trì	1882
330710	Xã Lộc Tiến	1882
330709	Xã Lộc Thủy	1882
330708	Xã Lộc Sơn	1882
330707	Xã Lộc Hòa	1882
330706	Xã Lộc Điền	1882
330705	Xã Lộc Bổn	1882
330704	Xã Lộc Bình	1882
330703	Xã Lộc An	1882
330702	Thị trấn Phú Lộc	1882
330701	Thị trấn Lăng Cô	1882
800138	Xã Phú Gia	1749
330520	Xã Vinh Xuân	1749
330519	Xã Vinh Thanh	1749
330518	Xã Vinh Thái	1749
330517	Xã Vinh Phú	1749
330516	Xã Vinh Hà	1749
330515	Xã Vinh An	1749
330514	Xã Phú Xuân	1749
330513	Xã Phú Thượng	1749
330512	Xã Phú Thuận	1749
330511	Xã Phú Thanh	1749
330510	Xã Phú Mỹ	1749
330509	Xã Phú Mậu	1749
330508	Xã Phú Lương	1749
330507	Xã Phú Hồ	1749
330506	Xã Phú Hải	1749
330505	Xã Phú Dương	1749
330504	Xã Phú Diên	1749
330503	Xã Phú An	1749
330502	Thị trấn Thuận An	1749
330501	Thị trấn Phú Đa	1749
330612	Xã Thủy Vân	1698
330611	Xã Thủy Thanh	1698
330610	Xã Thủy Tân	1698
330609	Xã Thủy Phù	1698
330608	Xã Thủy Bằng	1698
330607	Xã Phú Sơn	1698
330606	Xã Dương Hòa	1698
330605	Phường Thủy Phương	1698
330604	Phường Thủy Lương	1698
330603	Phường Thủy Dương	1698
330602	Phường Thủy Châu	1698
330601	Phường Phú Bài	1698
800170	Xã Bình Tiến	1697
330416	Xã Hương Vinh	1697
330415	Xã Hương Toàn	1697
330414	Xã Hương Thọ	1697
330413	Xã Hương Phong	1697
330412	Xã Hương Bình	1697
330411	Xã Hồng Tiến	1697
330410	Xã Hải Dương	1697
330409	Xã Bình Thành	1697
330408	Xã Bình Điền	1697
330407	Phường Tứ Hạ	1697
330406	Phường Hương Xuân	1697
330405	Phường Hương Văn	1697
330404	Phường Hương Vân	1697
330403	Phường Hương Hồ	1697
330402	Phường Hương Chữ	1697
330401	Phường Hương An	1697
90814	Xã Hương Thọ	1585
90813	Phường Hương Hồ	1585
90812	Phường Hương Vinh	1585
90811	Xã Hương Phong	1585
90810	Xã Hải Dương	1585
90809	Xã Thủy Bằng	1585
90808	Phường Thủy Vân	1585
90807	Phường Phú Thượng	1585
90806	Xã Phú Thanh	1585
90805	Xã Phú Mậu	1585
90804	Xã Phú Dương	1585
90803	Phường Thuận An	1585
90802	Phường Hương An	1585
90801	Phường Thuận Hòa	1585
90800	Phường Tây Lộc	1585
90799	Phường Đông Ba	1585
90798	Phường Thuận Lộc	1585
90797	Phường Gia Hội	1585
330127	Phường Xuân Phú	1585
330126	Phường Vĩnh Ninh	1585
330125	Phường Vỹ Dạ	1585
330124	Phường Trường An	1585
330123	Phường Thuỷ Xuân	1585
330122	Phường Thuỷ Biều	1585
330121	Phường Thuận Thành	1585
330120	Phường Thuận Lộc	1585
330119	Phường Thuận Hòa	1585
330118	Phường Tây Lộc	1585
330117	Phường Phường Đúc	1585
330116	Phường Phước Vĩnh	1585
330115	Phường Phú Thuận	1585
330114	Phường Phú Nhuận	1585
330113	Phường Phú Hội	1585
330112	Phường Phú Hòa	1585
330111	Phường Phú Hiệp	1585
330110	Phường Phú Hậu	1585
330109	Phường Phú Cát	1585
330108	Phường Phú Bình	1585
330107	Phường Kim Long	1585
330106	Phường Hương Sơ	1585
330105	Phường Hương Long	1585
330104	Phường An Tây	1585
330103	Phường An Hòa	1585
330102	Phường An Đông	1585
330101	Phường An Cựu	1585
160909	Xã Yên Dương	3271
160908	Xã Tam Quan	3271
160907	Xã Minh Quang	3271
160906	Xã Hợp Châu	3271
160905	Xã Hồ Sơn	3271
160904	Xã Đạo Trù	3271
160903	Xã Đại Đình	3271
160902	Xã Bồ Lý	3271
160901	Thị trấn Tam Đảo	3271
160717	Xã Yên Thạch	3265
160716	Xã Tứ Yên	3265
160715	Xã Tân Lập	3265
160714	Xã Quang Yên	3265
160713	Xã Phương Khoan	3265
160712	Xã Như Thụy	3265
160711	Xã Nhạo Sơn	3265
160710	Xã Nhân Đạo	3265
160709	Xã Lãng Công	3265
160708	Xã Hải Lựu	3265
160707	Xã Đức Bác	3265
160706	Xã Đồng Thịnh	3265
160705	Xã Đồng Quế	3265
160704	Xã Đôn Nhân	3265
160703	Xã Cao Phong	3265
160702	Xã Bạch Lưu	3265
160701	Thị trấn Tam Sơn	3265
91338	Phường Hai Bà Trưng	2065
160810	Xã Tiền Châu	2065
160809	Xã Ngọc Thanh	2065
160808	Xã Nam Viêm	2065
160807	Xã Cao Minh	2065
160806	Phường Xuân Hoà	2065
160805	Phường Trưng Trắc	2065
160804	Phường Trưng Nhị	2065
160803	Phường Phúc Thắng	2065
160802	Phường Hùng Vương	2065
160801	Phường Đồng Xuân	2065
91340	Xã Hội Thịnh	2009
160213	Xã Vân Hội	2009
160212	Xã Thanh Vân	2009
160211	Xã Kim Long	2009
160210	Xã Hướng Đạo	2009
160209	Xã Hợp Thịnh	2009
160208	Xã Hoàng Lâu	2009
160207	Xã Hoàng Hoa	2009
160206	Xã Hoàng Đan	2009
160205	Xã Duy Phiên	2009
160204	Xã Đồng Tĩnh	2009
160203	Xã Đạo Tú	2009
160202	Xã An Hòa	2009
160201	Thị trấn Hợp Hòa	2009
91339	Xã Tây Sơn	1960
160320	Xã Xuân Lôi	1960
160319	Xã Xuân Hòa	1960
160318	Xã Vân Trục	1960
160317	Xã Văn Quán	1960
160316	Xã Tử Du	1960
160315	Xã Triệu Đề	1960
160314	Xã Tiên Lữ	1960
160313	Xã Thái Hòa	1960
160312	Xã Sơn Đông	1960
160311	Xã Quang Sơn	1960
160310	Xã Ngọc Mỹ	1960
160309	Xã Liễn Sơn	1960
160308	Xã Liên Hòa	1960
160307	Xã Hợp Lý	1960
160306	Xã Đồng Ích	1960
160305	Xã Đình Chu	1960
160304	Xã Bàn Giản	1960
160303	Xã Bắc Bình	1960
160302	Thị trấn Lập Thạch	1960
160301	Thị trấn Hoa Sơn	1960
160517	Xã Yên Phương	1734
160516	Xã Yên Đồng	1734
160515	Xã Văn Tiến	1734
160514	Xã Trung Nguyên	1734
160513	Xã Trung Kiên	1734
160512	Xã Trung Hà	1734
160511	Xã Tề Lỗ	1734
160510	Xã Tam Hồng	1734
160509	Xã Nguyệt Đức	1734
160508	Xã Liên Châu	1734
160507	Xã Hồng Phương	1734
160506	Xã Hồng Châu	1734
160505	Xã Đồng Văn	1734
160504	Xã Đồng Cương	1734
160503	Xã Đại Tự	1734
160502	Xã Bình Định	1734
160501	Thị trấn Yên Lạc	1734
91344	Xã Vĩnh Phú	1733
91343	Xã An Nhân	1733
91342	Xã Lương Điền	1733
91341	Xã Sao Đại Việt	1733
800263	Xã Tân Phú	1733
160429	Xã Yên Lập	1733
160428	Xã Yên Bình	1733
160427	Xã Vũ Di	1733
160426	Xã Vĩnh Thịnh	1733
160425	Xã Vĩnh Sơn	1733
160424	Xã Vĩnh Ninh	1733
160423	Xã Việt Xuân	1733
160422	Xã Vân Xuân	1733
160421	Xã Tuân Chính	1733
160420	Xã Thượng Trưng	1733
160419	Xã Tân Tiến	1733
160418	Xã Tân Cương	1733
160417	Xã Tam Phúc	1733
160416	Xã Phú Thịnh	1733
160415	Xã Phú Đa	1733
160414	Xã Ngũ Kiên	1733
160413	Xã Nghĩa Hưng	1733
160412	Xã Lý Nhân	1733
160411	Xã Lũng Hoà	1733
160410	Xã Kim Xá	1733
160409	Xã Đại Đồng	1733
160408	Xã Chấn Hưng	1733
160407	Xã Cao Đại	1733
160406	Xã Bồ Sao	1733
160405	Xã Bình Dương	1733
160404	Xã An Tường	1733
160403	Thị trấn Vĩnh Tường	1733
160402	Thị trấn Tứ Trưng	1733
160401	Thị Trấn Thổ Tang	1733
160613	Xã Trung Mỹ	1732
160612	Xã Thiện Kế	1732
160611	Xã Tân Phong	1732
160610	Xã Tam Hợp	1732
160609	Xã Sơn Lôi	1732
160608	Xã Quất Lưu	1732
160607	Xã Phú Xuân	1732
160606	Xã Hương Sơn	1732
160605	Xã Đạo Đức	1732
160604	Xã Bá Hiến	1732
160603	Thị trấn Thanh Lãng	1732
160602	Thị trấn Hương Canh	1732
160601	Thị trấn Gia Khánh	1732
160109	Xã Thanh Trù	1578
160108	Xã Định Trung	1578
160107	Phường Tích Sơn	1578
160106	Phường Ngô Quyền	1578
160105	Phường Liên Bảo	1578
160104	Phường Khai Quang	1578
160103	Phường Hội Hợp	1578
160102	Phường Đồng Tâm	1578
160101	Phường Đống Đa	1578
55079	Xã Thạnh Tiến	3317
55078	Xã Thạnh Thắng	3317
55077	Xã Thạnh Qưới	3317
55076	Xã Thạnh Mỹ	3317
55075	Xã Thạnh Lợi	3317
55074	Xã Thạnh Lộc	3317
55073	Xã Thạnh An	3317
55072	Thị trấn Vĩnh Thạnh	3317
550711	Xã Vĩnh Trinh	3317
550710	Xã Vĩnh Bình	3317
55071	Thị trấn Thanh An	3317
550913	Xã Xuân Thắng	3300
550912	Xã Trường Xuân B	3300
550911	Xã Trường Xuân A	3300
550910	Xã Trường Xuân	3300
550909	Xã Trường Thành	3300
550908	Xã Trường Thắng	3300
550907	Xã Thới Thạnh	3300
550906	Xã Thới Tân	3300
550905	Xã Tân Thạnh	3300
550904	Xã Đông Thuận	3300
550903	Xã Đông Bình	3300
550902	Xã Định Môn	3300
550901	Thị trấn Thới Lai	3300
550507	Xã Trường Long	3250
550506	Xã Tân Thới	3250
550505	Xã Nhơn Nghĩa	3250
550504	Xã Nhơn Ái	3250
550503	Xã Mỹ Khánh	3250
550502	Xã Giai Xuân	3250
550501	Thị trấn Phong Điền	3250
550610	Xã Trung Thạnh	3150
550609	Xã Trung Hưng	3150
550608	Xã Trung An	3150
550607	Xã Thới Xuân	3150
550606	Xã Thới Hưng	3150
550605	Xã Thới Đông	3150
550604	Xã Thạnh Phú	3150
550603	Xã Đông Thắng	3150
550602	Xã Đông Hiệp	3150
550601	Thị trấn Cờ Đỏ	3150
550809	Phường Trung Nhứt	1576
550808	Phường Trung Kiên	1576
550807	Phường Thuận Hưng	1576
550806	Phường Thuận An	1576
550805	Phường Thốt Nốt	1576
550804	Phường Thới Thuận	1576
550803	Phường Thạnh Hoà	1576
550802	Phường Tân Lộc	1576
550801	Phường Tân Hưng	1576
550407	Phường Trường Lạc	1575
550406	Phường Thới Long	1575
550405	Phường Thới Hòa	1575
550404	Phường Thới An	1575
550403	Phường Phước Thới	1575
550402	Phường Long Hưng	1575
550401	Phường Châu Văn Liêm	1575
550307	Phường Thường Thạnh	1574
550306	Phường Tân Phú	1574
550305	Phường Phú Thứ	1574
550304	Phường Lê Bình	1574
550303	Phường Hưng Thạnh	1574
550302	Phường Hưng Phú	1574
550301	Phường Ba Láng	1574
550208	Phường Trà Nóc	1573
550207	Phường Trà An	1573
550206	Phường Thới An Đông	1573
550205	Phường Long Tuyền	1573
550204	Phường Long Hòa	1573
550203	Phường Bùi Hữu Nghĩa	1573
550202	Phường Bình Thủy	1573
550201	Phường An Thới	1573
550113	Phường Xuân Khánh	1572
550112	Phường Thới Bình	1572
550111	Phường Tân An	1572
550110	Phường Hưng Lợi	1572
550109	Phường Cái Khế	1572
550108	Phường An Phú	1572
550107	Phường An Nghiệp	1572
550106	Phường An Lạc	1572
550105	Phường An Khánh	1572
550104	Phường An Hội	1572
550103	Phường An Hòa	1572
550102	Phường An Cư	1572
550101	Phường An Bình	1572
541011	Xã Vân Khánh Tây	3125
541010	Xã Vân Khánh Đông	3125
541009	Xã Vân Khánh	3125
541008	Xã Thuận Hoà	3125
541007	Xã Tân Thạnh	3125
541006	Xã Đông Thạnh	3125
541005	Xã Đông Hưng B	3125
541004	Xã Đông Hưng A	3125
541003	Xã Đông Hưng	3125
541002	Xã Đông Hòa	3125
541001	Thị trấn Thứ Mười Một	3125
541108	Xã Vĩnh Thuận	2260
541107	Xã Vĩnh Phong	2260
541106	Xã Vĩnh Bình Nam	2260
541105	Xã Vĩnh Bình Bắc	2260
541104	Xã Tân Thuận	2260
541103	Xã Phong Đông	2260
541102	Xã Bình Minh	2260
541101	Thị trấn Vĩnh Thuận	2260
541406	Xã Vĩnh Hòa	2251
541405	Xã Thạnh Yên A	2251
541404	Xã Thạnh Yên	2251
541403	Xã Minh Thuận	2251
541402	Xã Hoà Chánh	2251
541401	Xã An Minh Bắc	2251
541505	Xã Vĩnh Phú	2134
541504	Xã Vĩnh Điều	2134
541503	Xã Tân Khánh Hòa	2134
541502	Xã Phú Mỹ	2134
541501	Xã Phú Lợi	2134
540811	Xã Vĩnh Tuy	2132
540810	Xã Vĩnh Thắng	2132
540809	Xã Vĩnh Phước B	2132
540808	Xã Vĩnh Phước A	2132
540807	Xã Vĩnh Hòa Hưng Nam	2132
540806	Xã Vĩnh Hòa Hưng Bắc	2132
540805	Xã Thủy Liễu	2132
540804	Xã Thới Quản	2132
540803	Xã Định Hòa	2132
540802	Xã Định An	2132
540801	Thị trấn Gò Quao	2132
541210	Xã Thổ Châu	2115
541209	Xã Hòn Thơm	2115
541208	Xã Hàm Ninh	2115
541207	Xã Gành Dầu	2115
541206	Xã Dương Tơ	2115
541205	Xã Cửa Dương	2115
541204	Xã Cửa Cạn	2115
541203	Xã Bãi Thơm	2115
541202	Thị trấn Dương Đông	2115
541201	Thị trấn An Thới	2115
541304	Xã Nam Du	2113
541303	Xã Lại Sơn	2113
541302	Xã Hòn Tre	2113
541301	Xã An Sơn	2113
540207	Xã Tiên Hải	2058
540206	Xã Thuận Yên	2058
540205	Xã Mỹ Đức	2058
540204	Phường Tô Châu	2058
540203	Phường Pháo Đài	2058
540202	Phường Đông Hồ	2058
540201	Phường Bình San	2058
540308	Xã Sơn Hải	1950
540307	Xã Kiên Bình	1950
540306	Xã Hòn Nghệ	1950
540305	Xã Hòa Điền	1950
540304	Xã Dương Hòa	1950
540303	Xã Bình Trị	1950
540302	Xã Bình An	1950
540301	Thị trấn Kiên Lương	1950
540909	Xã Tây Yên A	1833
540908	Xã Tây Yên	1833
540907	Xã Nam Yên	1833
540906	Xã Nam Thái A	1833
540905	Xã Nam Thái	1833
540904	Xã Hưng Yên	1833
540903	Xã Đông Yên	1833
540902	Xã Đông Thái	1833
540901	Thị trấn Thứ 3	1833
540719	Xã Vĩnh Thạnh	1832
540718	Xã Vĩnh Phú	1832
540717	Xã Thạnh Phước	1832
540716	Xã Thạnh Lộc	1832
540715	Xã Thạnh Hưng	1832
540714	Xã Thạnh Hòa	1832
540713	Xã Thạnh Bình	1832
540712	Xã Ngọc Thuận	1832
540711	Xã Ngọc Thành	1832
540710	Xã Ngọc Hoà	1832
540709	Xã Ngọc Chúc	1832
540708	Xã Long Thạnh	1832
540707	Xã Hoà Lợi	1832
540706	Xã Hòa Hưng	1832
540705	Xã Hoà An	1832
540704	Xã Bàn Thạch	1832
540703	Xã Bàn Tân Định	1832
540702	Xã  Hòa Thuận	1832
540701	Thị Trấn Giồng Riềng	1832
540511	Xã Thạnh Trị	1831
540510	Xã Thạnh Đông B	1831
540509	Xã Thạnh Đông A	1831
540508	Xã Thạnh Đông	1831
540507	Xã Tân Thành	1831
540506	Xã Tân Hội	1831
540505	Xã Tân Hoà	1831
540504	Xã Tân Hiệp B	1831
540503	Xã Tân Hiệp A	1831
540502	Xã Tân An	1831
540501	Thị trấn Tân Hiệp	1831
540414	Xã Thổ Sơn	1830
540413	Xã Sơn Kiên	1830
540412	Xã Sơn Bình	1830
540411	Xã Nam Thái Sơn	1830
540410	Xã Mỹ Thuận	1830
540409	Xã Mỹ Thái	1830
540408	Xã Mỹ Phước	1830
540407	Xã Mỹ Lâm	1830
540406	Xã Mỹ Hiệp Sơn	1830
540405	Xã Lình Huỳnh	1830
540404	Xã Bình Sơn	1830
540403	Xã Bình Giang	1830
540402	Thị trấn Sóc Sơn	1830
540401	Thị trấn Hòn Đất	1830
54069	Xã Vĩnh Hòa Hiệp	1719
54068	Xã Thạnh Lộc	1719
54067	Xã Mong Thọ B	1719
54066	Xã Mong Thọ A	1719
54065	Xã Mong Thọ	1719
54064	Xã Minh Hòa	1719
54063	Xã Giục Tượng	1719
54062	Xã Bình An	1719
540610	Xã Vĩnh Hoà Phú	1719
54061	Thị trấn Minh Lương	1719
540112	Xã Phi Thông	1570
540111	Phường Vĩnh Thông	1570
540110	Phường Vĩnh Thanh Vân	1570
540109	Phường Vĩnh Thanh	1570
540108	Phường Vĩnh Quang	1570
540107	Phường Vĩnh Lợi	1570
540106	Phường Vĩnh Lạc	1570
540105	Phường Vĩnh Hiệp	1570
540104	Phường Vĩnh Bảo	1570
540103	Phường Rạch Sỏi	1570
540102	Phường An Hòa	1570
540101	Phường An Bình	1570
590710	Xã Vĩnh Tân	2272
590709	Xã Vĩnh Hiệp	2272
590708	Xã Vĩnh Hải	2272
590707	Xã Lai Hòa	2272
590706	Xã Lạc Hòa	2272
590705	Xã Hòa Đông	2272
590704	Phường Vĩnh Phước	2272
590703	Phường Khánh Hòa	2272
590702	Phường 2	2272
590701	Phường 1	2272
590510	Xã Vĩnh Thành	2238
590509	Xã Vĩnh Lợi	2238
590508	Xã Tuân Tức	2238
590507	Xã Thạnh Trị	2238
590506	Xã Thạnh Tân	2238
590505	Xã Lâm Tân	2238
590504	Xã Lâm Kiết	2238
590503	Xã Châu Hưng	2238
590502	Thị trấn Phú Lộc	2238
590501	Thị trấn Hưng Lợi	2238
590309	Xã Thuận Hưng	2173
590308	Xã Phú Mỹ	2173
590307	Xã Mỹ Tú	2173
590306	Xã Mỹ Thuận	2173
590305	Xã Mỹ Phước	2173
590304	Xã Mỹ Hương	2173
590303	Xã Long Hưng	2173
590302	Xã Hưng Phú	2173
590301	Thị trấn Huỳnh Hữu Nghĩa	2173
590611	Xã Trường Khánh	2161
590610	Xã Tân Thạnh	2161
590609	Xã Tân Hưng	2161
590608	Xã Song Phụng	2161
590607	Xã Phú Hữu	2161
590606	Xã Long Phú	2161
590605	Xã Long Đức	2161
590604	Xã Hậu Thạnh	2161
590603	Xã Châu Khánh	2161
590602	Thị trấn Long Phú	2161
590601	Thị trấn Đại Ngãi	2161
590808	Xã Đại Ân 1	2093
590807	Xã An Thạnh Tây	2093
590806	Xã An Thạnh Nam	2093
590805	Xã An Thạnh Đông	2093
590804	Xã An Thạnh 3	2093
590803	Xã An Thạnh 2	2093
590802	Xã An Thạnh 1	2093
590801	Thị trấn Cù Lao Dung	2093
590908	Xã Vĩnh Quới	2062
590907	Xã Tân Long	2062
590906	Xã Mỹ Quới	2062
590905	Xã Mỹ Bình	2062
590904	Xã Long Bình	2062
590903	Phường 3	2062
590902	Phường 2	2062
590901	Phường 1	2062
591111	Xã Viên Bình	2037
591110	Xã Viên An	2037
591109	Xã Trung Bình	2037
591108	Xã Thạnh Thới Thuận	2037
591107	Xã Thạnh Thới An	2037
591106	Xã Tài Văn	2037
591105	Xã Liêu Tú	2037
591104	Xã Lịch Hội Thượng	2037
591103	Xã Đại Ân  2	2037
591102	Thị trấn Trần Đề	2037
591101	Thị trấn Lịch Hội Thượng	2037
590213	Xã Xuân Hòa	1949
590212	Xã Trinh Phú	1949
590211	Xã Thới An Hội	1949
590210	Xã Phong Nẫm	1949
590209	Xã Nhơn Mỹ	1949
590208	Xã Kế Thành	1949
590207	Xã Kế An	1949
590206	Xã Đại Hải	1949
590205	Xã Ba Trinh	1949
590204	Xã An Mỹ	1949
590203	Xã An Lạc Tây	1949
590202	Thị trấn Kế Sách	1949
590201	Thị trấn An Lạc Thôn	1949
59108	Xã Thuận Hòa	1910
59107	Xã Thiện Mỹ	1910
59106	Xã Phú Tân	1910
59105	Xã Phú Tâm	1910
59104	Xã Hồ Đắc Kiện	1910
59103	Xã An Ninh	1910
59102	Xã An Hiệp	1910
59101	Thị trấn Châu Thành	1910
590411	Xã Thạnh Quới	1743
590410	Xã Thạnh Phú	1743
590409	Xã Tham Đôn	1743
590408	Xã Ngọc Tố	1743
590407	Xã Ngọc Đông	1743
590406	Xã Hòa Tú II	1743
590405	Xã Hòa Tú 1	1743
590404	Xã Gia Hòa 2	1743
590403	Xã Gia Hòa 1	1743
590402	Xã Đại Tâm	1743
590401	Thị trấn Mỹ Xuyên	1743
590110	Phường 9	1568
590109	Phường 8	1568
590108	Phường 7	1568
590107	Phường 6	1568
590106	Phường 5	1568
590105	Phường 4	1568
590104	Phường 3	1568
590103	Phường 2	1568
590102	Phường 10	1568
590101	Phường 1	1568
510813	Xã Vĩnh Thạnh Trung	1758
510812	Xã Thạnh Mỹ Tây	1758
510811	Xã Ô Long Vỹ	1758
510810	Xã Mỹ Phú	1758
510809	Xã Mỹ Đức	1758
510808	Xã Khánh Hòa	1758
510807	Xã Đào Hữu Cảnh	1758
510806	Xã Bình Thủy	1758
510805	Xã Bình Phú	1758
510804	Xã Bình Mỹ	1758
510803	Xã Bình Long	1758
510802	Xã Bình Chánh	1758
510801	Thị trấn Cái Dầu	1758
90770	Xã Thanh Thịnh	1757
90769	Thị trấn Đồng Tâm	1757
510918	Xã Tấn Mỹ	1757
510917	Xã Nhơn Mỹ	1757
510916	Xã Mỹ Hội Đông	1757
510915	Xã Mỹ Hiệp	1757
510914	Xã Mỹ An	1757
510913	Xã Long Kiến	1757
510912	Xã Long Giang	1757
510911	Xã Long Điền B	1757
510910	Xã Long Điền A	1757
510909	Xã Kiến Thành	1757
510908	Xã Kiến An	1757
510907	Xã Hội An	1757
510906	Xã Hòa Bình	1757
510905	Xã Hòa An	1757
510904	Xã Bình Phước Xuân	1757
510903	Xã An Thạnh Trung	1757
510902	Thị trấn Mỹ Luông	1757
510901	Thị trấn Chợ Mới	1757
510518	Xã Tân Trung	1756
510517	Xã Tân Hòa	1756
510516	Xã Bình Thạnh Đông	1756
510515	Xã Phú Hưng	1756
510514	Xã Phú Thọ	1756
510513	Xã Phú Bình	1756
510512	Xã Hiệp Xương	1756
510511	Xã Phú Xuân	1756
510510	Xã Phú An	1756
510509	Xã Phú Thành	1756
510508	Xã Hoà Lạc	1756
510507	Xã Phú Thạnh	1756
510506	Xã Phú Hiệp	1756
510505	Xã Phú Lâm	1756
510504	Xã Phú Long	1756
510503	Xã Long Hoà	1756
510502	Thị trấn Chợ Vàm	1756
510501	Thị trấn Phú Mỹ	1756
510414	Phường Long Sơn	1755
510413	Xã Lê Chánh	1755
510412	Xã Phú Vĩnh	1755
510411	Xã Châu Phong	1755
510410	Phường Long Phú	1755
510409	Xã Long An	1755
510408	Xã Tân An	1755
510407	Xã Tân Thạnh	1755
510406	Xã Vĩnh Hòa	1755
510405	Xã Vĩnh Xương	1755
510404	Xã Phú Lộc	1755
510403	Phường Long Châu	1755
510402	Phường Long Hưng	1755
510401	Phường Long Thạnh	1755
510314	Xã Đa Phước	1754
510313	Xã Vĩnh Hội Đông	1754
510312	Xã Vĩnh Trường	1754
510311	Xã Vĩnh Hậu	1754
510310	Xã Vĩnh Lộc	1754
510309	Xã Phước Hưng	1754
510308	Xã Phú Hội	1754
510307	Xã Phú Hữu	1754
510306	Xã Nhơn Hội	1754
510305	Xã Quốc Thái	1754
510304	Xã Khánh Bình	1754
510303	Thị Trấn Long Bình	1754
510302	Xã Khánh An	1754
510301	Thị trấn An Phú	1754
510207	Xã Vĩnh Châu	1753
510206	Xã Vĩnh Tế	1753
510205	Phường Vĩnh Ngươn	1753
510204	Phường Núi Sam	1753
510203	Phường Vĩnh Mỹ	1753
510202	Phường Châu Phú A	1753
510201	Phường Châu Phú B	1753
510614	Xã Vĩnh Trung	1752
510613	Xã Văn Giáo	1752
510612	Xã Thới Sơn	1752
510611	Xã Tân Lợi	1752
510610	Xã Tân Lập	1752
510609	Xã Núi Voi	1752
510608	Xã Nhơn Hưng	1752
510607	Xã An Phú	1752
510606	Xã An Nông	1752
510605	Xã An Hảo	1752
510604	Xã An Cư	1752
510603	Thị trấn Tịnh Biên	1752
510602	Thị trấn Nhà Bàng	1752
510601	Thị trấn Chi Lăng	1752
510715	Xã Vĩnh Phước	1751
510714	Xã Vĩnh Gia	1751
510713	Xã Tân Tuyến	1751
510712	Xã Tà Đảnh	1751
510711	Xã Ô Lâm	1751
510710	Xã Núi Tô	1751
510709	Xã Lương Phi	1751
510708	Xã Lương An Trà	1751
510707	Xã Lê Trì	1751
510706	Xã Lạc Quới	1751
510705	Xã Cô Tô	1751
510704	Xã Châu Lăng	1751
510703	Xã An Tức	1751
510702	Thị trấn Tri Tôn	1751
510701	Thị trấn Ba Chúc	1751
511117	Xã Vọng Thê	1750
511116	Xã Vọng Đông	1750
511115	Xã Vĩnh Trạch	1750
511114	Xã Vĩnh Phú	1750
511113	Xã Vĩnh Khánh	1750
511112	Xã Vĩnh Chánh	1750
511111	Xã Thoại Giang	1750
511110	Xã Tây Phú	1750
511109	Xã Phú Thuận	1750
511108	Xã Mỹ Phú Đông	1750
511107	Xã Định Thành	1750
511106	Xã Định Mỹ	1750
511105	Xã Bình Thành	1750
511104	Xã An Bình	1750
511103	Thị trấn Phú Hoà	1750
511102	Thị Trấn Óc Eo	1750
511101	Thị trấn Núi Sập	1750
90791	Xã Thạnh Phú	1718
90788	Xã Thuận Hòa	1718
90787	Xã An Hiệp	1718
90776	Thị trấn Mái Dầm	1718
90775	Xã Đông Thạnh	1718
90771	Xã Giao Long	1718
511013	Xã Vĩnh Thành	1718
511012	Xã Vĩnh Nhuận	1718
511011	Xã Vĩnh Lợi	1718
511010	Xã Vĩnh Hanh	1718
511009	Xã Vĩnh Bình	1718
511008	Xã Vĩnh An	1718
511007	Xã Tân Phú	1718
511006	Xã Hòa Bình Thạnh	1718
511005	Xã Cần Đăng	1718
511004	Xã Bình Thạnh	1718
511003	Xã Bình Hòa	1718
511002	Xã An Hòa	1718
511001	Thị trấn An Châu	1718
510113	Xã Mỹ Hoà Hưng	1566
510112	Xã Mỹ Khánh	1566
510111	Phường Mỹ Hòa	1566
510110	Phường Mỹ Thạnh	1566
510109	Phường Mỹ Thới	1566
510108	Phường Mỹ Quý	1566
510107	Phường Mỹ Phước	1566
510106	Phường Bình Khánh	1566
510105	Phường Bình Đức	1566
510104	Phường Mỹ Xuyên	1566
510103	Phường Đông Xuyên	1566
510102	Phường Mỹ Long	1566
510101	Phường Mỹ Bình	1566
90835	Xã Phú Thuận A	3696
90834	Xã Phú Thuận B	3696
90833	Xã Long Thuận	3696
90832	Xã Long Khánh B	3696
90831	Xã Long Khánh A	3696
90830	Xã Thường Lạc	3696
90829	Xã Thường Phước 2	3696
90828	Thị trấn Thường Thới Tiền	3696
90827	Xã Thường Thới Hậu A	3696
90826	Xã Thường Phước 1	3696
90825	Phường An Bình A	3200
90824	Phường An Bình B	3200
90823	Phường An Lạc	3200
90822	Xã Tân Hội	3200
90821	Xã Bình Thạnh	3200
90820	Phường An Thạnh	3200
90819	Phường An Lộc	3200
500411	Thị Trấn Thường Thới Tiền	3200
500410	Xã Thường Thới Hậu B	3200
500409	Xã Thường Thới Hậu A	3200
500408	Xã Thường Phước 2	3200
500407	Xã Thường Phước 1	3200
500406	Xã Thường Lạc	3200
500405	Xã Phú Thuận B	3200
500404	Xã Phú Thuận A	3200
500403	Xã Long Thuận	3200
500402	Xã Long Khánh B	3200
500401	Xã Long Khánh A	3200
50119	Xã Tân Bình	3155
50118	Xã Phú Long	3155
50117	Xã Phú Hựu	3155
50116	Xã Hòa Tân	3155
50115	Xã An Phú Thuận	3155
50114	Xã An Nhơn	3155
50113	Xã An Khánh	3155
50112	Xã An Hiệp	3155
501112	Xã Tân Phú Trung	3155
501111	Xã Tân Phú	3155
501110	Xã Tân Nhuận Đông	3155
50111	Thị trấn Cái Tàu Hạ	3155
501207	Xã Tân Hội	2059
501206	Xã Bình Thạnh	2059
501205	Xã An Bình B	2059
501204	Xã An Bình A	2059
501203	Phường An Thạnh	2059
501202	Phường An Lộc	2059
501201	Phường An Lạc	2059
500913	Xã Trường Xuân	2030
500912	Xã Thanh Mỹ	2030
500911	Xã Thạnh Lợi	2030
500910	Xã Tân Kiều	2030
500909	Xã Phú Điền	2030
500908	Xã Mỹ Quý	2030
500907	Xã Mỹ Hòa	2030
500906	Xã Mỹ Đông	2030
500905	Xã Mỹ An	2030
500904	Xã Láng Biển	2030
500903	Xã Hưng Thạnh	2030
500902	Xã Đốc Binh Kiều	2030
500901	Thị trấn Mỹ An	2030
500613	Xã Tân Thạnh	2026
500612	Xã Tân Quới	2026
500611	Xã Tân Phú	2026
500610	Xã Tân Mỹ	2026
500609	Xã Tân Long	2026
500608	Xã Tân Huề	2026
500607	Xã Tân Hòa	2026
500606	Xã Tân Bình	2026
500605	Xã Phú Lợi	2026
500604	Xã Bình Thành	2026
500603	Xã Bình Tấn	2026
500602	Xã An Phong	2026
500601	Thị trấn Thanh Bình	2026
500309	Xã Thông Bình	2013
500308	Xã Tân Thành B	2013
500307	Xã Tân Thành A	2013
500306	Xã Tân Phước	2013
500305	Xã Tân Hộ Cơ	2013
500304	Xã Tân Công Chí	2013
500303	Xã Bình Phú	2013
500302	Xã An Phước	2013
500301	Thị trấn Sa Rài	2013
500512	Xã Tân Công Sính	2011
500511	Xã Phú Thọ	2011
500510	Xã Phú Thành B	2011
500509	Xã Phú Thành A	2011
500508	Xã Phú Ninh	2011
500507	Xã Phú Hiệp	2011
500506	Xã Phú Đức	2011
500505	Xã Phú Cường	2011
500504	Xã Hoà Bình	2011
500503	Xã An Long	2011
500502	Xã An Hòa	2011
500501	Thị trấn Tràm Chim	2011
500813	Xã Vĩnh Thạnh	1961
500812	Xã Tân Mỹ	1961
500811	Xã Tân  Khánh Trung	1961
500810	Xã Mỹ An Hưng B	1961
500809	Xã Mỹ An Hưng A	1961
500808	Xã Long Hưng B	1961
500807	Xã Long Hưng A	1961
500806	Xã Hội An Đông	1961
500805	Xã Định Yên	1961
500804	Xã Định An	1961
500803	Xã Bình Thạnh Trung	1961
500802	Xã Bình Thành	1961
500801	Thị trấn Lấp Vò	1961
501012	Xã Vĩnh Thới	1725
501011	Xã Tân Thành	1725
501010	Xã Tân Phước	1725
501009	Xã Tân Hòa	1725
501008	Xã Tân Dương	1725
501007	Xã Phong Hòa	1725
501006	Xã Long Thắng	1725
501005	Xã Long Hậu	1725
501004	Xã Hòa Thành	1725
501003	Xã Hòa Long	1725
501002	Xã Định Hòa	1725
501001	Thị trấn Lai Vung	1725
500718	Xã Tân Nghĩa	1724
500717	Xã Tân Hội Trung	1724
500716	Xã Phương Trà	1724
500715	Xã Phương Thịnh	1724
500714	Xã Phong Mỹ	1724
500713	Xã Nhị Mỹ	1724
500712	Xã Mỹ Xương	1724
500711	Xã Mỹ Thọ	1724
500710	Xã Mỹ Long	1724
500709	Xã Mỹ Hội	1724
500708	Xã Mỹ Hiệp	1724
500707	Xã Gáo Giồng	1724
500706	Xã Bình Thạnh	1724
500705	Xã Bình Hàng Trung	1724
500704	Xã Bình Hàng Tây	1724
500703	Xã Ba Sao	1724
500702	Xã An Bình	1724
500701	Thị trấn Mỹ Thọ	1724
500209	Xã Tân Quy Tây	1668
500208	Xã Tân Phú Đông	1668
500207	Xã Tân Khánh Đông	1668
500206	Phường Tân Quy Đông	1668
500205	Phường An Hoà	1668
500204	Phường 4	1668
500203	Phường 3	1668
500202	Phường 2	1668
500201	Phường 1	1668
500115	Xã Tịnh Thới	1564
500114	Xã Tân Thuận Tây	1564
500113	Xã Tân Thuận Đông	1564
500112	Xã Mỹ Trà	1564
500111	Xã Mỹ Tân	1564
500110	Xã Mỹ Ngãi	1564
500109	Xã Hòa An	1564
500108	Phường Mỹ Phú	1564
500107	Phường Hoà Thuận	1564
500106	Phường 6	1564
500105	Phường 4	1564
500104	Phường 3	1564
500103	Phường 2	1564
500102	Phường 11	1564
500101	Phường 1	1564
570720	Xã Trung Thành Tây	2263
570719	Xã Trung Thành Đông	2263
570718	Xã Trung Thành	2263
570717	Xã Trung Nghĩa	2263
570716	Xã Trung Ngãi	2263
570715	Xã Trung Hiếu	2263
570714	Xã Trung Hiệp	2263
570713	Xã Trung Chánh	2263
570712	Xã Trung An	2263
570711	Xã Thanh Bình	2263
570710	Xã Tân Quới Trung	2263
570709	Xã Tân An Luông	2263
570708	Xã Quới Thiện	2263
570707	Xã Quới An	2263
570706	Xã Hiếu Thuận	2263
570705	Xã Hiếu Thành	2263
570704	Xã Hiếu Phụng	2263
570703	Xã Hiếu Nhơn	2263
570702	Xã Hiếu Nghĩa	2263
570701	Thị trấn Vũng Liêm	2263
570313	Xã Tân Long Hội	2164
570312	Xã Tân Long	2164
570311	Xã Tân An Hội	2164
570310	Xã Nhơn Phú	2164
570309	Xã Mỹ Phước	2164
570308	Xã Mỹ An	2164
570307	Xã Long Mỹ	2164
570306	Xã Hòa Tịnh	2164
570305	Xã Chánh Hội	2164
570304	Xã Chánh An	2164
570303	Xã Bình Phước	2164
570302	Xã An Phước	2164
570301	Thị trấn Cái Nhum	2164
570811	Xã Thành Trung	2081
570810	Xã Thành Lợi	2081
570809	Xã Thành Đông	2081
570808	Xã Tân Thành	2081
570807	Xã Tân Quới	2081
570806	Xã Tân Lược	2081
570805	Xã Tân Hưng	2081
570804	Xã Tân Bình	2081
570803	Xã Tân An Thạnh	2081
570802	Xã Nguyễn Văn Thảnh	2081
570801	Xã Mỹ Thuận	2081
570408	Xã Thuận An	2054
570407	Xã Mỹ Hòa	2054
570406	Xã Đông Thạnh	2054
570405	Xã Đông Thành	2054
570404	Xã Đông Bình	2054
570403	Phường Thành Phước	2054
570402	Phường Đông Thuận	2054
570401	Phường Cái Vồn	2054
570614	Xã Xuân Hiệp	2034
570613	Xã Vĩnh Xuân	2034
570612	Xã Trà Côn	2034
570611	Xã Tích Thiện	2034
570610	Xã Thuận Thới	2034
570609	Xã Thới Hòa	2034
570608	Xã Thiện Mỹ	2034
570607	Xã Tân Mỹ	2034
570606	Xã Phú Thành	2034
570605	Xã Nhơn Bình	2034
570604	Xã Lục Sỹ Thành	2034
570603	Xã Hựu Thành	2034
570602	Xã Hòa Bình	2034
570601	Thị trấn Trà Ôn	2034
570517	Xã Tường Lộc	2008
570516	Xã Tân Phú	2008
570515	Xã Tân Lộc	2008
570514	Xã Song Phú	2008
570513	Xã Phú Thịnh	2008
570512	Xã Phú Lộc	2008
570511	Xã Ngãi Tứ	2008
570510	Xã Mỹ Thạnh Trung	2008
570509	Xã Mỹ Lộc	2008
570508	Xã Long Phú	2008
570507	Xã Loan Mỹ	2008
570506	Xã Hòa Thạnh	2008
570505	Xã Hoà Lộc	2008
570504	Xã Hòa Hiệp	2008
570503	Xã Hậu Lộc	2008
570502	Xã Bình Ninh	2008
570501	Thị trấn Tam Bình	2008
570215	Xã Thạnh Quới	1962
570214	Xã Thanh Đức	1962
570213	Xã Tân Hạnh	1962
570212	Xã Phước Hậu	1962
570211	Xã Phú Quới	1962
570210	Xã Phú Đức	1962
570209	Xã Long Phước	1962
570208	Xã Long An	1962
570207	Xã Lộc Hòa	1962
570206	Xã Hòa Phú	1962
570205	Xã Hòa Ninh	1962
570204	Xã Đồng Phú	1962
570203	Xã Bình Hòa Phước	1962
570202	Xã An Bình	1962
570201	Thị trấn Long Hồ	1962
570111	Xã Trường An	1562
570110	Xã Tân Ngãi	1562
570109	Xã Tân Hội	1562
570108	Xã Tân Hòa	1562
570107	Phường 9	1562
570106	Phường 8	1562
570105	Phường 5	1562
570104	Phường 4	1562
570103	Phường 3	1562
570102	Phường 2	1562
570101	Phường 1	1562
580907	Xã Trường Long Hòa	3443
580906	Xã Long Toàn	3443
580905	Xã Long Hữu	3443
580904	Xã Hiệp Thạnh	3443
580903	Xã Dân Thành	3443
580902	Phường 2	3443
580901	Phường 1	3443
580807	Xã Ngũ Lạc	2103
580806	Xã Long Vĩnh	2103
580805	Xã Long Khánh	2103
580804	Xã Đông Hải	2103
580803	Xã Đôn Xuân	2103
580802	Xã Đôn Châu	2103
580801	Thị trấn Long Thành	2103
580311	Xã Thông Hòa	2091
580310	Xã Thạnh Phú	2091
580309	Xã Tam Ngãi	2091
580308	Xã Phong Thạnh	2091
580307	Xã Phong Phú	2091
580306	Xã Ninh Thới	2091
580305	Xã Hoà Tân	2091
580304	Xã Hòa Ân	2091
580303	Xã Châu Điền	2091
580302	Xã An Phú Tân	2091
580301	Thị trấn Cầu Kè	2091
580214	Xã Tân Bình	2086
580213	Xã Tân An	2086
580212	Xã Phương Thạnh	2086
580211	Xã Nhị Long Phú	2086
580210	Xã Nhị Long	2086
580209	Xã Mỹ Cẩm	2086
580208	Xã Huyền Hội	2086
580207	Xã Đức Mỹ	2086
580206	Xã Đại Phước	2086
580205	Xã Đại Phúc	2086
580204	Xã Bình Phú	2086
580203	Xã An Trường A	2086
580202	Xã An Trường	2086
580201	Thị trấn Càng Long	2086
580617	Xã Thanh Sơn	2033
580616	Xã Tập Sơn	2033
580615	Xã Tân Sơn	2033
580614	Xã Tân Hiệp	2033
580613	Xã Phước Hưng	2033
580612	Xã Ngọc Biên	2033
580611	Xã Ngãi Xuyên	2033
580610	Xã Lưu Nghiệp Anh	2033
580609	Xã Long Hiệp	2033
580608	Xã Kim Sơn	2033
580607	Xã Hàm Tân	2033
580606	Xã Hàm Giang	2033
580605	Xã Định An	2033
580604	Xã Đại An	2033
580603	Xã An Quảng Hữu	2033
580602	Thị trấn Trà Cú	2033
580601	Thị trấn Định An	2033
580411	Xã Tập Ngãi	2020
580410	Xã Tân Hùng	2020
580409	Xã Tân Hòa	2020
580408	Xã Phú Cần	2020
580407	Xã Ngãi Hùng	2020
580406	Xã Long Thới	2020
580405	Xã Hùng Hòa	2020
580404	Xã Hiếu Tử	2020
580403	Xã Hiếu Trung	2020
580402	Thị trấn Tiểu Cần	2020
580401	Thị trấn Cầu Quan	2020
58059	Xã Lương Hoà A	1911
58058	Xã Lương Hòa	1911
58057	Xã Long Hòa	1911
58056	Xã Hưng Mỹ	1911
58055	Xã Hòa Thuận	1911
58054	Xã Hòa Minh	1911
58053	Xã Hòa Lợi	1911
58052	Xã Đa Lộc	1911
580514	Xã Thanh Mỹ	1911
580513	Xã Song Lộc	1911
580512	Xã Phước Hảo	1911
580511	Xã Nguyệt Hóa	1911
580510	Xã Mỹ Chánh	1911
58051	Thị trấn Châu Thành	1911
580715	Xã Vĩnh Kim	1908
580714	Xã Trường Thọ	1908
580713	Xã Thuận Hòa	1908
580712	Xã Thạnh Hòa Sơn	1908
580711	Xã Nhị Trường	1908
580710	Xã Mỹ Long Nam	1908
580709	Xã Mỹ Long Bắc	1908
580708	Xã Mỹ Hòa	1908
580707	Xã Long Sơn	1908
580706	Xã Kim Hòa	1908
580705	Xã Hiệp Mỹ Tây	1908
580704	Xã Hiệp Mỹ Đông	1908
580703	Xã Hiệp Hòa	1908
580702	Thị trấn Mỹ Long	1908
580701	Thị trấn Cầu Ngang	1908
580110	Xã Long Đức	1560
580109	Phường 9	1560
580108	Phường 8	1560
580107	Phường 7	1560
580106	Phường 6	1560
580105	Phường 5	1560
580104	Phường 4	1560
580103	Phường 3	1560
580102	Phường 2	1560
580101	Phường 1	1560
560311	Xã Vĩnh Thành	3158
560310	Xã Vĩnh Hòa	3158
560309	Xã Vĩnh Bình	3158
560308	Xã Tân Thiềng	3158
560307	Xã Sơn Định	3158
560306	Xã Phú Sơn	3158
560305	Xã Phú Phụng	3158
560304	Xã Long Thới	3158
560303	Xã Hưng Khánh Trung B	3158
560302	Xã Hòa Nghĩa	3158
560301	Thị trấn Chợ Lách	3158
560818	Xã Thới Thạnh	2028
560817	Xã Thạnh Phong	2028
560816	Xã Thạnh Hải	2028
560815	Xã Tân Phong	2028
560814	Xã Quới Điền	2028
560813	Xã Phú Khánh	2028
560812	Xã Mỹ Hưng	2028
560811	Xã Mỹ An	2028
560810	Xã Hòa Lợi	2028
560809	Xã Giao Thạnh	2028
560808	Xã Đại Điền	2028
560807	Xã Bình Thạnh	2028
560806	Xã An Thuận	2028
560805	Xã An Thạnh	2028
560804	Xã An Quy	2028
560803	Xã An Nhơn	2028
560802	Xã An Điền	2028
560801	Thị trấn Thạnh Phú	2028
800305	Xã Bình Khánh	1975
560917	Xã Thành Thới B	1975
560916	Xã Thành Thới A	1975
560915	Xã Tân Trung	1975
560914	Xã Tân Hội	1975
560913	Xã Phước Hiệp	1975
560912	Xã Ngãi Đăng	1975
560911	Xã Minh Đức	1975
560910	Xã Hương Mỹ	1975
560909	Xã Định Thủy	1975
560908	Xã Đa Phước Hội	1975
560907	Xã Cẩm Sơn	1975
560906	Xã Bình Khánh Tây	1975
560905	Xã Bình Khánh Đông	1975
560904	Xã An Thới	1975
560903	Xã An Thạnh	1975
560902	Xã An Định	1975
560901	Thị trấn Mỏ Cày	1975
560413	Xã Thanh Tân	1974
560412	Xã Thạnh Ngãi	1974
560411	Xã Thành An	1974
560410	Xã Tân Thanh Tây	1974
560409	Xã Tân Thành Bình	1974
560408	Xã Tân Phú Tây	1974
560407	Xã Tân Bình	1974
560406	Xã Phước Mỹ Trung	1974
560405	Xã Phú Mỹ	1974
560404	Xã Nhuận Phú Tân	1974
560403	Xã Khánh Thạnh Tân	1974
560402	Xã Hưng Khánh Trung A	1974
560401	Xã Hòa Lộc	1974
560522	Xã Thuận Điền	1937
560521	Xã Thạnh Phú Đông	1937
560520	Xã Tân Thanh	1937
560519	Xã Tân Lợi Thạnh	1937
560518	Xã Tân Hào	1937
560517	Xã Sơn Phú	1937
560516	Xã Phước Long	1937
560515	Xã Phong Nẫm	1937
560514	Xã Phong Mỹ	1937
560513	Xã Mỹ Thạnh	1937
560512	Xã Lương Quới	1937
560511	Xã Lương Phú	1937
560510	Xã Lương Hòa	1937
560509	Xã Long Mỹ	1937
560508	Xã Hưng Phong	1937
560507	Xã Hưng Nhượng	1937
560506	Xã Hưng Lễ	1937
560505	Xã Châu Hòa	1937
560504	Xã Châu Bình	1937
560503	Xã Bình Thành	1937
560502	Xã Bình Hoà	1937
560501	Thị trấn Giồng Trôm	1937
560620	Xã Vang Quới Tây	1895
560619	Xã Vang Quới Đông	1895
560618	Xã Thừa Đức	1895
560617	Xã Thới Thuận	1895
560616	Xã Thới Lai	1895
560615	Xã Thạnh Trị	1895
560614	Xã Thạnh Phước	1895
560613	Xã Tam Hiệp	1895
560612	Xã Phú Vang	1895
560611	Xã Phú Thuận	1895
560610	Xã Phú Long	1895
560609	Xã Long Hòa	1895
560608	Xã Long Định	1895
560607	Xã Lộc Thuận	1895
560606	Xã Định Trung	1895
560605	Xã Đại Hòa Lộc	1895
560604	Xã Châu Hưng	1895
560603	Xã Bình Thới	1895
560602	Xã Bình Thắng	1895
560601	Thị trấn Bình Đại	1895
91626	Thị trấn Tiệm Tôm	1888
800306	Xã Phước Ngãi	1888
560724	Xã Vĩnh Hòa	1888
560723	Xã Vĩnh An	1888
560722	Xã Tân Xuân	1888
560721	Xã Tân Thủy	1888
560720	Xã Tân Mỹ	1888
560719	Xã Tân Hưng	1888
560718	Xã Phước Tuy	1888
560717	Xã Phú Ngãi	1888
560716	Xã Phú Lễ	1888
560715	Xã Mỹ Thạnh	1888
560714	Xã Mỹ Nhơn	1888
560713	Xã Mỹ Hòa	1888
560712	Xã Mỹ Chánh	1888
560711	Xã Bảo Thuận	1888
560710	Xã Bảo Thạnh	1888
560709	Xã An Thủy	1888
560708	Xã An Phú Trung	1888
560707	Xã An Ngãi Trung	1888
560706	Xã An Ngãi Tây	1888
560705	Xã An Hòa Tây	1888
560704	Xã An Hiệp	1888
560703	Xã An Đức	1888
560702	Xã An Bình Tây	1888
560701	Thị trấn Ba Tri	1888
56029	Xã Phú An Hòa	1742
56028	Xã Hữu Định	1742
56027	Xã Giao Long	1742
56026	Xã Giao Hòa	1742
56025	Xã An Phước	1742
56024	Xã An Khánh	1742
56023	Xã An Hóa	1742
560222	Xã Tường Đa	1742
560221	Xã Tiên Thủy	1742
560220	Xã Tiên Long	1742
56022	Xã An Hiệp	1742
560219	Xã Thành Triệu	1742
560218	Xã Tân Thạch	1742
560217	Xã Tân Phú	1742
560216	Xã Tam Phước	1742
560215	Xã Sơn Hòa	1742
560214	Xã Quới Thành	1742
560213	Xã Qưới Sơn	1742
560212	Xã Phước Thạnh	1742
560211	Xã Phú Túc	1742
560210	Xã Phú Đức	1742
56021	Thị trấn Châu Thành	1742
800304	Phường An Hội	1558
560117	Xã Sơn Đông	1558
560116	Xã Phú Nhuận	1558
560115	Xã Phú Hưng	1558
560114	Xã Nhơn Thạnh	1558
560113	Xã Mỹ Thạnh An	1558
560112	Xã Mỹ Thành	1558
560111	Xã Bình Phú	1558
560110	Phường Phú Tân	1558
560109	Phường Phú Khương	1558
560108	Phường 8	1558
560107	Phường 7	1558
560106	Phường 6	1558
560105	Phường 5	1558
560104	Phường 4	1558
560103	Phường 3	1558
560102	Phường 2	1558
560101	Phường 1	1558
530913	Xã Thạnh Tân	3275
530912	Xã Thạnh Mỹ	3275
530911	Xã Thạnh Hoà	3275
530910	Xã Tân Lập 2	3275
530909	Xã Tân Lập 1	3275
530908	Xã Tân Hòa Thành	3275
530907	Xã Tân Hòa Tây	3275
530906	Xã Tân Hòa Đông	3275
530905	Xã Phước Lập	3275
530904	Xã Phú Mỹ	3275
530903	Xã Mỹ Phước	3275
530902	Xã Hưng Thạnh	3275
530901	Thị trấn Mỹ Phước	3275
531006	Xã Tân Thới	2216
531005	Xã Tân Thạnh	2216
531004	Xã Tân Phú	2216
531003	Xã Phú Thạnh	2216
531002	Xã Phú Tân	2216
531001	Xã Phú Đông	2216
530416	Xã Thạnh Lộc	2084
530415	Xã Tân Phong	2084
530414	Xã Tam Bình	2084
530413	Xã Phú Nhuận	2084
530412	Xã Phú Cường	2084
530411	Xã Phú An	2084
530410	Xã Ngũ Hiệp	2084
530409	Xã Mỹ Thành Nam	2084
530408	Xã Mỹ Thành Bắc	2084
530407	Xã Mỹ Long	2084
530406	Xã Long Trung	2084
530405	Xã Long Tiên	2084
530404	Xã Hội Xuân	2084
530403	Xã Hiệp Đức	2084
530402	Xã Cẩm Sơn	2084
530401	Xã Bình Phú	2084
530212	Xã Tân Trung	2057
530211	Xã Long Thuận	2057
530210	Xã Long Hưng	2057
530209	Xã Long Hòa	2057
530208	Xã Long Chánh	2057
530207	Xã Bình Xuân	2057
530206	Xã Bình Đông	2057
530205	Phường 5	2057
530204	Phường 4	2057
530203	Phường 3	2057
530202	Phường 2	2057
530201	Phường 1	2057
531116	Xã Thanh Hòa	2055
531115	Xã Tân Phú	2055
531114	Xã Tân Hội	2055
531113	Xã Tân Bình	2055
531112	Xã Phú Quý	2055
531111	Xã Nhị Quý	2055
531110	Xã Mỹ Phước Tây	2055
531109	Xã Mỹ Hạnh Trung	2055
531108	Xã Mỹ Hạnh Đông	2055
531107	Xã Long Khánh	2055
531106	Phường Nhị Mỹ	2055
531105	Phường 5	2055
531104	Phường 4	2055
531103	Phường 3	2055
531102	Phường 2	2055
531101	Phường 1	2055
530713	Xã Yên Luông	1933
530712	Xã Vĩnh Hựu	1933
530711	Xã Thạnh Trị	1933
530710	Xã Thạnh Nhựt	1933
530709	Xã Thành Công	1933
530708	Xã Long Vĩnh	1933
530707	Xã Long Bình	1933
530706	Xã Đồng Thạnh	1933
530705	Xã Đồng Sơn	1933
530704	Xã Bình Tân	1933
530703	Xã Bình Phú	1933
530702	Xã Bình Nhì	1933
530701	Thị trấn Vĩnh Bình	1933
530813	Xã Tăng Hoà	1932
530812	Xã Tân Thành	1932
530811	Xã Tân Tây	1932
530810	Xã Tân Phước	1932
530809	Xã Tân Đông	1932
530808	Xã Tân Điền	1932
530807	Xã Phước Trung	1932
530806	Xã Kiểng Phước	1932
530805	Xã Gia Thuận	1932
530804	Xã Bình Nghị	1932
530803	Xã Bình Ân	1932
530802	Thị trấn Vàm Láng	1932
530801	Thị trấn Tân Hòa	1932
530325	Xã Thiện Trung	1900
530324	Xã Thiện Trí	1900
530323	Xã Tân Thanh	1900
530322	Xã Tân Hưng	1900
530321	Xã Mỹ Trung	1900
530320	Xã Mỹ Tân	1900
530319	Xã Mỹ Lương	1900
530318	Xã Mỹ Lợi B	1900
530317	Xã Mỹ Lợi A	1900
530316	Xã Mỹ Hội	1900
530315	Xã Mỹ Đức Tây	1900
530314	Xã Mỹ Đức Đông	1900
530313	Xã Hòa Khánh	1900
530312	Xã Hòa Hưng	1900
530311	Xã Hậu Thành	1900
530310	Xã Hậu Mỹ Trinh	1900
530309	Xã Hậu Mỹ Phú	1900
530308	Xã Hậu Mỹ Bắc B	1900
530307	Xã Hậu Mỹ Bắc A	1900
530306	Xã Đông Hòa Hiệp	1900
530305	Xã An Thái Trung	1900
530304	Xã An Thái Đông	1900
530303	Xã An Hữu	1900
530302	Xã An Cư	1900
530301	Thị trấn Cái Bè	1900
530619	Xã Xuân Đông	1741
530618	Xã Trung Hòa	1741
530617	Xã Thanh Bình	1741
530616	Xã Tân Thuận Bình	1741
530615	Xã Tân Bình Thạnh	1741
530614	Xã Song Bình	1741
530613	Xã Quơn Long	1741
530612	Xã Phú Kiết	1741
530611	Xã Mỹ Tịnh An	1741
530610	Xã Lương Hòa Lạc	1741
530609	Xã Long Bình Điền	1741
530608	Xã Hòa Tịnh	1741
530607	Xã Hòa Định	1741
530606	Xã Đăng Hưng Phước	1741
530605	Xã Bình Phục Nhứt	1741
530604	Xã Bình Phan	1741
530603	Xã Bình Ninh	1741
530602	Xã An Thạnh Thủy	1741
530601	Thị trấn Chợ Gạo	1741
53059	Xã Kim Sơn	1740
53058	Xã Hữu Đạo	1740
53057	Xã Dưỡng Điềm	1740
53056	Xã Đông Hòa	1740
53055	Xã Điềm Hy	1740
53054	Xã Bình Trưng	1740
53053	Xã Bình Đức	1740
530523	Xã Vĩnh Kim	1740
530522	Xã Thạnh Phú	1740
530521	Xã Thân Cửu Nghĩa	1740
530520	Xã Tân Lý Tây	1740
53052	Xã Bàn Long	1740
530519	Xã Tân Lý Đông	1740
530518	Xã Tân Hương	1740
530517	Xã Tân Hội Đông	1740
530516	Xã Tam Hiệp	1740
530515	Xã Song Thuận	1740
530514	Xã Phú Phong	1740
530513	Xã Nhị Bình	1740
530512	Xã Long Hưng	1740
530511	Xã Long Định	1740
530510	Xã Long An	1740
53051	Thị trấn Tân Hiệp	1740
530117	Xã Trung An	1556
530116	Xã Thới Sơn	1556
530115	Xã Tân Mỹ Chánh	1556
530114	Xã Phước Thạnh	1556
530113	Xã Mỹ Phong	1556
530112	Xã Đạo Thạnh	1556
530111	Phường Tân Long	1556
530110	Phường 9	1556
530109	Phường 8	1556
530108	Phường 7	1556
530107	Phường 6	1556
530106	Phường 5	1556
530105	Phường 4	1556
530104	Phường 3	1556
530103	Phường 2	1556
530102	Phường 10	1556
530101	Phường 1	1556
491508	Xã Tuyên Thạnh	3329
491507	Xã Thạnh Trị	3329
491506	Xã Thạnh Hưng	3329
491505	Xã Bình Tân	3329
491504	Xã Bình Hiệp	3329
491503	Phường 3	3329
491502	Phường 2	3329
491501	Phường 1	3329
490210	Xã Vĩnh Trị	3315
490209	Xã Vĩnh Thuận	3315
490208	Xã Vĩnh Bình	3315
490207	Xã Tuyên Bình Tây	3315
490206	Xã Tuyên Bình	3315
490205	Xã Thái Trị	3315
490204	Xã Thái Bình Trung	3315
490203	Xã Khánh Hưng	3315
490202	Xã Hưng Điền A	3315
490201	Thị trấn Vĩnh Hưng	3315
490511	Xã Thủy Tây	3293
490510	Xã Thủy Đông	3293
490509	Xã Thuận Nghĩa Hòa	3293
490508	Xã Thuận Bình	3293
490507	Xã Thạnh Phước	3293
490506	Xã Thạnh Phú	3293
490505	Xã Thạnh An	3293
490504	Xã Tân Tây	3293
490503	Xã Tân Hiệp	3293
490502	Xã Tân Đông	3293
490501	Thị trấn Thạnh Hóa	3293
490413	Xã Tân Thành	3276
490412	Xã Tân Ninh	3276
490411	Xã Tân Lập	3276
490410	Xã Tân Hòa	3276
490409	Xã Tân Bình	3276
490408	Xã Nhơn Ninh	3276
490407	Xã Nhơn Hòa Lập	3276
490406	Xã Nhơn Hoà	3276
490405	Xã Kiến Bình	3276
490404	Xã Hậu Thạnh Tây	3276
490403	Xã Hậu Thạnh Đông	3276
490402	Xã Bắc Hòa	3276
490401	Thị trấn Tân Thạnh	3276
491412	Xã Vĩnh Thạnh	3273
491411	Xã Vĩnh Lợi	3273
491410	Xã Vĩnh Đại	3273
491409	Xã Vĩnh Châu B	3273
491408	Xã Vĩnh Châu A	3273
491407	Xã Vĩnh Bửu	3273
491406	Xã Thạnh Hưng	3273
491405	Xã Hưng Thạnh	3273
491404	Xã Hưng Hà	3273
491403	Xã Hưng Điền B	3273
491402	Xã Hưng Điền	3273
491401	Thị trấn Tân Hưng	3273
490307	Xã Tân Thành	3227
490306	Xã Tân Lập	3227
490305	Xã Bình Thạnh	3227
490304	Xã Bình Phong Thạnh	3227
490303	Xã Bình Hòa Trung	3227
490302	Xã Bình Hòa Tây	3227
490301	Xã Bình Hòa Đông	3227
490611	Xã Mỹ Thạnh Tây	2129
490610	Xã Mỹ Thạnh Đông	2129
490609	Xã Mỹ Thạnh Bắc	2129
490608	Xã Mỹ Quý Tây	2129
490607	Xã Mỹ Quý Đông	2129
490606	Xã Mỹ Bình	2129
490605	Xã Bình Thành	2129
490604	Xã Bình Hòa Nam	2129
490603	Xã Bình Hòa Hưng	2129
490602	Xã Bình Hòa Bắc	2129
490601	Thị trấn Đông Thành	2129
800070	Xã Tân Long	2031
490913	Xã Tân Thành	2031
490912	Xã Tân Lập	2031
490911	Xã Nhị Thành	2031
490910	Xã Mỹ Thạnh	2031
490909	Xã Mỹ Phú	2031
490908	Xã Mỹ Lạc	2031
490907	Xã Mỹ An	2031
490906	Xã Long Thuận	2031
490905	Xã Long Thạnh	2031
490904	Xã Long Thành	2031
490903	Xã Bình Thạnh	2031
490902	Xã Bình An	2031
490901	Thị trấn Thủ Thừa	2031
800071	Xã Tân Bình	2016
491111	Xã Tân Phước Tây	2016
491110	Xã Quê Mỹ Thạnh	2016
491109	Xã Nhựt Ninh	2016
491108	Xã Mỹ Bình	2016
491107	Xã Lạc Tấn	2016
491106	Xã Đức Tân	2016
491105	Xã Bình Trinh Đông	2016
491104	Xã Bình Tịnh	2016
491103	Xã Bình Lãng	2016
491102	Xã An Nhựt Tân	2016
491101	Thị trấn Tân Trụ	2016
490720	Xã Tân Phú	1929
490719	Xã Tân Mỹ	1929
490718	Xã Mỹ Hạnh Nam	1929
490717	Xã Mỹ Hạnh Bắc	1929
490716	Xã Lộc Giang	1929
490715	Xã Hựu Thạnh	1929
490714	Xã Hòa Khánh Tây	1929
490713	Xã Hòa Khánh Nam	1929
490712	Xã Hòa Khánh Đông	1929
490711	Xã Hiệp Hòa	1929
490710	Xã Đức Lập Thượng	1929
490709	Xã Đức Lập Hạ	1929
490708	Xã Đức Hòa Thượng	1929
490707	Xã Đức Hòa Hạ	1929
490706	Xã Đức Hòa Đông	1929
490705	Xã An Ninh Tây	1929
490704	Xã An Ninh Đông	1929
490703	Thị trấn Hiệp Hòa	1929
490702	Thị trấn Hậu Nghĩa	1929
490701	Thị trấn Đức Hòa	1929
49109	Xã Phước Tân Hưng	1909
49108	Xã Phú Ngãi Trị	1909
49107	Xã Long Trì	1909
49106	Xã Hòa Phú	1909
49105	Xã Hiệp Thạnh	1909
49104	Xã Dương Xuân Hội	1909
49103	Xã Bình Quới	1909
49102	Xã An Lục Long	1909
491013	Xã Vĩnh Công	1909
491012	Xã Thuận Mỹ	1909
491011	Xã Thanh Vĩnh Đông	1909
491010	Xã Thanh Phú Long	1909
49101	Thị trấn Tầm Vu	1909
491317	Xã Trường Bình	1907
491316	Xã Thuận Thành	1907
491315	Xã Tân Tập	1907
491314	Xã Tân Kim	1907
491313	Xã Phước Vĩnh Tây	1907
491312	Xã Phước Vĩnh Đông	1907
491311	Xã Phước Lý	1907
491310	Xã Phước Lâm	1907
491309	Xã Phước Lại	1907
491308	Xã Phước Hậu	1907
491307	Xã Mỹ Lộc	1907
491306	Xã Long Thượng	1907
491305	Xã Long Phụng	1907
491304	Xã Long Hậu	1907
491303	Xã Long An	1907
491302	Xã Đông Thạnh	1907
491301	Thị trấn Cần Giuộc	1907
491217	Xã Tân Trạch	1906
491216	Xã Tân Lân	1906
491215	Xã Tân Chánh	1906
491214	Xã Tân Ân	1906
491213	Xã Phước Vân	1906
491212	Xã Phước Tuy	1906
491211	Xã Phước Đông	1906
491210	Xã Mỹ Lệ	1906
491209	Xã Long Trạch	1906
491208	Xã Long Sơn	1906
491207	Xã Long Khê	1906
491206	Xã Long Hựu Tây	1906
491205	Xã Long Hựu Đông	1906
491204	Xã Long Hòa	1906
491203	Xã Long Định	1906
491202	Xã Long Cang	1906
491201	Thị trấn Cần Đước	1906
490815	Xã Thanh Phú	1894
490814	Xã Thạnh Lợi	1894
490813	Xã Thạnh Hòa	1894
490812	Xã Thạnh Đức	1894
490811	Xã Tân Hòa	1894
490810	Xã Tân Bửu	1894
490809	Xã Phước Lợi	1894
490808	Xã Nhựt Chánh	1894
490807	Xã Mỹ Yên	1894
490806	Xã Lương Hòa	1894
490805	Xã Lương Bình	1894
490804	Xã Long Hiệp	1894
490803	Xã Bình Đức	1894
490802	Xã An Thạnh	1894
490801	Thị trấn Bến Lức	1894
490114	Xã Nhơn Thạnh Trung	1554
490113	Xã Lợi Bình Nhơn	1554
490112	Xã Hướng Thọ Phú	1554
490111	Xã Bình Tâm	1554
490110	Xã An Vĩnh Ngãi	1554
490109	Phường Tân Khánh	1554
490108	Phường Khánh Hậu	1554
490107	Phường 7	1554
490106	Phường 6	1554
490105	Phường 5	1554
490104	Phường 4	1554
490103	Phường 3	1554
490102	Phường 2	1554
490101	Phường 1	1554
400913	Xã Krông Jing	3418
400912	Xã Krông Á	3418
400911	Xã Ea Trang	3418
400910	Xã Ea Riêng	3418
400909	Xã Ea Pil	3418
400908	Xã Ea M' Doal	3418
400907	Xã Ea Lai	3418
400906	Xã Ea H'MLay	3418
400905	Xã Cư San	3418
400904	Xã Cư Prao	3418
400903	Xã Cư M'ta	3418
400902	Xã Cư K Róa	3418
400901	Thị trấn M'Đrắk	3418
401211	Xã Yang Tao	3217
401210	Xã Nam Ka	3217
401209	Xã Krông Nô	3217
401208	Xã Ea R'Bin	3217
401207	Xã Đắk Phơi	3217
401206	Xã Đắk Nuê	3217
401205	Xã Đắk Liêng	3217
401204	Xã Buôn Triết	3217
401203	Xã Buôn Tría	3217
401202	Xã Bông Krang	3217
401201	Thị trấn Liên Sơn	3217
401408	Xã Hòa Hiệp	3153
401407	Xã Ea Tiêu	3153
401406	Xã Ea Ning	3153
401405	Xã Ea Ktur	3153
401404	Xã Ea Hu	3153
401403	Xã Ea BHốk	3153
401402	Xã Dray Bhăng	3153
401401	Xã Cư Ê Wi	3153
400307	Xã Tân Lập	2150
400306	Xã Pơng Drang	2150
400305	Xã Ea Sin	2150
400304	Xã Ea Ngai	2150
400303	Xã Cư Pơng	2150
400302	Xã Cư Né	2150
400301	Xã Chư KBô	2150
400510	Xã Ya Tờ Mốt	2131
400509	Xã Ia RVê	2131
400508	Xã Ia Lốp	2131
400507	Xã Ia JLơi	2131
400506	Xã Ea Rốk	2131
400505	Xã Ea Lê	2131
400504	Xã Ea Bung	2131
400503	Xã Cư M'Lan	2131
400502	Xã Cư KBang	2131
400501	Thị trấn Ea Súp	2131
400716	Xã Vụ Bổn	1954
400715	Xã Tân Tiến	1954
400714	Xã KRông Búk	1954
400713	Xã Hòa Tiến	1954
400712	Xã Hòa Đông	1954
400711	Xã Hòa An	1954
400710	Xã Ea Yông	1954
400709	Xã Ea Yiêng	1954
400708	Xã Ea Uy	1954
400707	Xã Ea Phê	1954
400706	Xã Ea Kuăng	1954
400705	Xã Ea KNuec	1954
400704	Xã Ea Kly	1954
400703	Xã Ea Kênh	1954
400702	Xã Ea Hiu	1954
400701	Thị trấn Phước An	1954
400816	Xã Xuân Phú	1931
400815	Xã Ea Tih	1931
400814	Xã Ea Sô	1931
400813	Xã Ea Sar	1931
400812	Xã Ea Păl	1931
400811	Xã Ea Ô	1931
400810	Xã Ea Kmút	1931
400809	Xã Ea Đar	1931
400808	Xã Cư Prông	1931
400807	Xã Cư Ni	1931
400806	Xã Cư Jang	1931
400805	Xã Cư Huê	1931
400804	Xã Cư ELang	1931
400803	Xã Cư Bông	1931
400802	Thị trấn Ea Knốp	1931
400801	Thị trấn Ea Kar	1931
401008	Xã Quảng Điền	1884
401007	Xã Ea Na	1884
401006	Xã Ea Bông	1884
401005	Xã Dur KMăl	1884
401004	Xã Dray Sáp	1884
401003	Xã Bình Hòa	1884
401002	Xã Băng A Drênh	1884
401001	Thị trấn Buôn Trấp	1884
401114	Xã Yang Reh	1789
401113	Xã Yang Mao	1789
401112	Xã Khuê Ngọc Điền	1789
401111	Xã Hòa Thành	1789
401110	Xã Hòa Tân	1789
401109	Xã Hòa Sơn	1789
401108	Xã Hòa Phong	1789
401107	Xã Hòa Lễ	1789
401106	Xã Ea Trul	1789
401105	Xã Dang Kang	1789
401104	Xã Cư Pui	1789
401103	Xã Cư KTy	1789
401102	Xã Cư Drăm	1789
401101	Thị trấn Krông Kmar	1789
401512	Xã Ea Siên	1788
401511	Xã Ea Drông	1788
401510	Xã Ea Blang	1788
401509	Xã Cư Bao	1788
401508	Xã Bình Thuận	1788
401507	Phường Thống Nhất	1788
401506	Phường Thiện An	1788
401505	Phường Đoàn Kết	1788
401504	Phường Đạt Hiếu	1788
401503	Phường Bình Tân	1788
401502	Phường An Lạc	1788
401501	Phường An Bình	1788
400412	Xã Tam Giang	1787
400411	Xã Phú Xuân	1787
400410	Xã Phú Lộc	1787
400409	Xã Ea Tóh	1787
400408	Xã Ea Tân	1787
400407	Xã Ea Tam	1787
400406	Xã Ea Puk	1787
400405	Xã Ea Hồ	1787
400404	Xã Ea Dăh	1787
400403	Xã ĐLiê Ya	1787
400402	Xã Cư Klông	1787
400401	Thị trấn Krông Năng	1787
400212	Xã Ea Wy	1786
400211	Xã Ea Tir	1786
400210	Xã Ea Sol	1786
400209	Xã Ea Ral	1786
400208	Xã Ea Nam	1786
400207	Xã Ea Khal	1786
400206	Xã Ea H'leo	1786
400205	Xã Ea Hiao	1786
400204	Xã Dlê Yang	1786
400203	Xã Cư Mốt	1786
400202	Xã Cư A Mung	1786
400201	Thị trấn Ea Drăng	1786
400617	Xã Quảng Tiến	1785
400616	Xã Quảng Hiệp	1785
400615	Xã Ea Tul	1785
400614	Xã Ea Tar	1785
400613	Xã Ea M'nang	1785
400612	Xã Ea M'DRóh	1785
400611	Xã Ea Kuêh	1785
400610	Xã Ea KPam	1785
400609	Xã Ea Kiết	1785
400608	Xã Ea H'đinh	1785
400607	Xã Ea D'Rơng	1785
400606	Xã Cuor Đăng	1785
400605	Xã Cư Suê	1785
400604	Xã Cư M'gar	1785
400603	Xã Cư Dliê M'nông	1785
400602	Thị trấn Quảng Phú	1785
400601	Thị trấn Ea Pốk	1785
401307	Xã Tân Hoà	1784
401306	Xã Krông Na	1784
401305	Xã Ea Wer	1784
401304	Xã Ea Nuôl	1784
401303	Xã Ea Huar	1784
401302	Xã Ea Bar	1784
401301	Xã Cuôr KNia	1784
400121	Xã Hòa Xuân	1552
400120	Xã Hòa Thuận	1552
400119	Xã Hòa Thắng	1552
400118	Xã Hòa Phú	1552
400117	Xã Hòa Khánh	1552
400116	Xã Ea Tu	1552
400115	Xã Ea Kao	1552
400114	Xã Cư ÊBur	1552
400113	Phường Tự An	1552
400112	Phường Thống Nhất	1552
400111	Phường Thành Nhất	1552
400110	Phường Thành Công	1552
400109	Phường Thắng Lợi	1552
400108	Phường Tân Tiến	1552
400107	Phường Tân Thành	1552
400106	Phường Tân Lợi	1552
400105	Phường Tân Lập	1552
400104	Phường Tân Hòa	1552
400103	Phường Tân An	1552
400102	Phường Khánh Xuân	1552
400101	Phường Ea Tam	1552
420419	Xã Tân Thượng	3160
420418	Xã Tân Nghĩa	3160
420417	Xã Tân Lâm	3160
420416	Xã Tân Châu	3160
420415	Xã Tam Bố	3160
420414	Xã Sơn Điền	3160
420413	Xã Liên Đầm	3160
420412	Xã Hòa Trung	3160
420411	Xã Hòa Ninh	3160
420410	Xã Hòa Nam	3160
420409	Xã Hòa Bắc	3160
420408	Xã Gung Ré	3160
420407	Xã Gia Hiệp	3160
420406	Xã Gia Bắc	3160
420405	Xã Đinh Trang Thượng	3160
420404	Xã Đinh Trang Hòa	3160
420403	Xã Đinh Lạc	3160
420402	Xã Bảo Thuận	3160
420401	Thị trấn Di Linh	3160
800072	Thị Trấn Phước Cát	3146
420911	Xã Tư Nghĩa	3146
420910	Xã Tiên Hoàng	3146
420909	Xã Quảng Ngãi	3146
420908	Xã Phước Cát 2	3146
420907	Xã Phước Cát 1	3146
420906	Xã Nam Ninh	3146
420905	Xã Mỹ Lâm	3146
420904	Xã Gia Viễn	3146
420903	Xã Đức Phổ	3146
420902	Xã Đồng Nai Thượng	3146
420901	Thị trấn Cát Tiên	3146
420811	Xã Triệu Hải	2106
420810	Xã Quốc Oai	2106
420809	Xã Quảng Trị	2106
420808	Xã Mỹ Đức	2106
420807	Xã Hương Lâm	2106
420806	Xã Hà Đông	2106
420805	Xã Đạ Pal	2106
420804	Xã Đạ Lây	2106
420803	Xã Đạ Kho	2106
420802	Xã An Nhơn	2106
420801	Thị trấn Đạ Tẻh	2106
91635	Xã Phù Mỹ	2104
91634	Xã Tư Nghĩa	2104
91633	Xã Mỹ Lâm	2104
91611	Xã Đồng Nai Thượng	2104
91610	Xã Quảng Ngãi	2104
91609	Xã Đức Phổ	2104
91608	Thị trấn Phước Cát	2104
91607	Xã Nam Ninh	2104
91606	Xã Gia Viễn	2104
91605	Xã Phước Cát 2	2104
91604	Xã Tiên Hoàng	2104
91603	Thị trấn Cát Tiên	2104
91602	Xã Đạ Pal	2104
91601	Xã Đạ Kho	2104
91600	Xã Đạ Lây	2104
91599	Xã Quảng Trị	2104
91598	Xã Mỹ Đức	2104
91597	Xã Quốc Oai	2104
91596	Xã An Nhơn	2104
91595	Thị trấn Đạ Tẻh	2104
91594	Xã Bà Gia	2104
420710	Xã Phước Lộc	2104
420709	Xã Ma Đa Guôi	2104
420708	Xã Hà Lâm	2104
420707	Xã Đoàn Kết	2104
420706	Xã Đạ Tồn	2104
420705	Xã Đạ Ploa	2104
420704	Xã Đạ Oai	2104
420703	Xã Đạ M'ri	2104
420702	Thị trấn Ma Đa Guôi	2104
420701	Thị trấn Đạ M'ri	2104
421016	Xã Tân Văn	1958
421015	Xã Tân Thanh	1958
421014	Xã Tân Hà	1958
421013	Xã Phúc Thọ	1958
421012	Xã Phú Sơn	1958
421011	Xã Phi Tô	1958
421010	Xã Nam Hà	1958
421009	Xã Mê Linh	1958
421008	Xã Liên Hà	1958
421007	Xã Hoài Đức	1958
421006	Xã Gia Lâm	1958
421005	Xã Đông Thanh	1958
421004	Xã Đan Phượng	1958
421003	Xã Đạ Đờn	1958
421002	Thị trấn Nam Ban	1958
421001	Thị trấn Đinh Văn	1958
420606	Xã Lát	1956
420605	Xã Đưng KNớ	1956
420604	Xã Đạ Sar	1956
420603	Xã Đạ Nhim	1956
420602	Xã Đạ Chais	1956
420601	Thị trấn Lạc Dương	1956
421208	Xã Rô Men	1919
421207	Xã Phi Liêng	1919
421206	Xã Liêng Srônh	1919
421205	Xã Đạ Tông	1919
421204	Xã Đạ Rsal	1919
421203	Xã Đạ M' Rong	1919
421202	Xã Đạ Long	1919
421201	Xã Đạ K' Nàng	1919
90772	Xã Nam Quang	1839
761214	Xã Tân Lạc	1839
761213	Xã Lộc Thành	1839
761212	Xã Lộc Tân	1839
761211	Xã Lộc Quảng	1839
761210	Xã Lộc Phú	1839
761209	Xã Lộc Ngãi	1839
761208	Xã Lộc Nam	1839
761207	Xã Lộc Lâm	1839
761206	Xã Lộc Đức	1839
761205	Xã Lộc Bảo	1839
761204	Xã Lộc Bắc	1839
761203	Xã Lộc An	1839
761202	Xã B' Lá	1839
42111	Thị trấn Lộc Thắng	1839
420211	Xã Lộc Thanh	1838
420210	Xã Lộc Nga	1838
420209	Xã Lộc Châu	1838
420208	Xã Đạm Bri	1838
420207	Xã Đại Lào	1838
420206	Phường Lộc Tiến	1838
420205	Phường Lộc Sơn	1838
420204	Phường Lộc Phát	1838
420203	Phường B'lao	1838
420202	Phường 2	1838
420201	Phường 1	1838
420315	Xã Tân Thành	1837
420314	Xã Tân Hội	1837
420313	Xã Tà Năng	1837
420312	Xã Tà Hine	1837
420311	Xã Phú Hội	1837
420310	Xã N'Thol Hạ	1837
420309	Xã Ninh Loan	1837
420308	Xã Ninh Gia	1837
420307	Xã Liên Hiệp	1837
420306	Xã Hiệp Thạnh	1837
420305	Xã Hiệp An	1837
420304	Xã Đa Quyn	1837
420303	Xã Đà Loan	1837
420302	Xã Bình Thạnh	1837
420301	Thị trấn Liên Nghĩa	1837
420510	Xã Tu Tra	1836
420509	Xã Quảng Lập	1836
420508	Xã Pró	1836
420507	Xã Lạc Xuân	1836
420506	Xã Lạc Lâm	1836
420505	Xã Ka Đơn	1836
420504	Xã Ka Đô	1836
420503	Xã Đạ Ròn	1836
420502	Thị trấn Thạnh Mỹ	1836
420501	Thị trấn D'Ran	1836
420116	Xã Xuân Trường	1550
420115	Xã Xuân Thọ	1550
420114	Xã Trạm Hành	1550
420113	Xã Tà Nung	1550
420112	Phường 9	1550
420111	Phường 8	1550
420110	Phường 7	1550
420109	Phường 6	1550
420108	Phường 5	1550
420107	Phường 4	1550
420106	Phường 3	1550
420105	Phường 2	1550
420104	Phường 12	1550
420103	Phường 11	1550
420102	Phường 10	1550
420101	Phường 1	1550
410514	Xã Sông Cầu	3213
410513	Xã Sơn Thái	3213
410512	Xã Liên Sang	3213
410511	Xã Khánh Trung	3213
410510	Xã Khánh Thượng	3213
410509	Xã Khánh Thành	3213
410508	Xã Khánh Phú	3213
410507	Xã Khánh Nam	3213
410506	Xã Khánh Hiệp	3213
410505	Xã Khánh Đông	3213
410504	Xã Khánh Bình	3213
410503	Xã Giang Ly	3213
410502	Xã Cầu Bà	3213
410501	Thị trấn Khánh Vĩnh	3213
410708	Xã Thành Sơn	3212
410707	Xã Sơn Trung	3212
410706	Xã Sơn Lâm	3212
410705	Xã Sơn Hiệp	3212
410704	Xã Sơn Bình	3212
410703	Xã Ba Cụm Nam	3212
410702	Xã Ba Cụm Bắc	3212
410701	Thị trấn Tô Hạp	3212
410803	Xã Song Tử Tây	2117
410802	Xã Sinh Tồn	2117
410801	Thị trấn Trường Sa	2117
410327	Xã Ninh Xuân	2061
410326	Xã Ninh Vân	2061
410325	Xã Ninh Trung	2061
410324	Xã Ninh Thượng	2061
410323	Xã Ninh Thọ	2061
410322	Xã Ninh Thân	2061
410321	Xã Ninh Tây	2061
410320	Xã Ninh Tân	2061
410319	Xã Ninh Sơn	2061
410318	Xã Ninh Sim	2061
410317	Xã Ninh Quang	2061
410316	Xã Ninh Phước	2061
410315	Xã Ninh Phụng	2061
410314	Xã Ninh Phú	2061
410313	Xã Ninh Lộc	2061
410312	Xã Ninh Ích	2061
410311	Xã Ninh Hưng	2061
410310	Xã Ninh Đông	2061
410309	Xã Ninh Bình	2061
410308	Xã Ninh An	2061
410307	Phường Ninh Thủy	2061
410306	Phường Ninh Hiệp	2061
410305	Phường Ninh Hải	2061
410304	Phường Ninh Hà	2061
410303	Phường Ninh Giang	2061
410302	Phường Ninh Diêm	2061
410301	Phường Ninh Đa	2061
410914	Xã Suối Tân	1902
410913	Xã Suối Cát	1902
410912	Xã Sơn Tân	1902
410911	Xã Cam Thành Bắc	1902
410910	Xã Cam Tân	1902
410909	Xã Cam Phước Tây	1902
410908	Xã Cam Hòa	1902
410907	Xã Cam Hiệp Nam	1902
410906	Xã Cam Hiệp Bắc	1902
410905	Xã Cam Hải Tây	1902
410904	Xã Cam Hải Đông	1902
410903	Xã Cam An Nam	1902
410902	Xã Cam An Bắc	1902
410901	Thị trấn Cam Đức	1902
410213	Xã Xuân Sơn	1829
410212	Xã Vạn Thọ	1829
410211	Xã Vạn Thạnh	1829
410210	Xã Vạn Thắng	1829
410209	Xã Vạn Phước	1829
410208	Xã Vạn Phú	1829
410207	Xã Vạn Lương	1829
410206	Xã Vạn Long	1829
410205	Xã Vạn Khánh	1829
410204	Xã Vạn Hưng	1829
410203	Xã Vạn Bình	1829
410202	Xã Đại Lãnh	1829
410201	Thị trấn Vạn Giã	1829
91591	Xã Xuân Đồng	1739
800301	Xã Bình Lộc	1739
410419	Xã Suối Tiên	1739
410418	Xã Suối Hiệp	1739
410417	Xã Diên Xuân	1739
410416	Xã Diên Toàn	1739
410415	Xã Diên Thọ	1739
410414	Xã Diên Thạnh	1739
410413	Xã Diên Tân	1739
410412	Xã Diên Sơn	1739
410411	Xã Diên Phước	1739
410410	Xã Diên Phú	1739
410409	Xã Diên Lộc	1739
410408	Xã Diên Lâm	1739
410407	Xã Diên Lạc	1739
410406	Xã Diên Hòa	1739
410405	Xã Diên Đồng	1739
410404	Xã Diên Điền	1739
410403	Xã Diên Bình	1739
410402	Xã Diên An	1739
410401	Thị trấn Diên Khánh	1739
410615	Xã Cam Thịnh Tây	1664
410614	Xã Cam Thịnh Đông	1664
410613	Xã Cam Thành Nam	1664
410612	Xã Cam Phước Đông	1664
410611	Xã Cam Lập	1664
410610	Xã Cam Bình	1664
410609	Phường Cam Thuận	1664
410608	Phường Cam Phúc Nam	1664
410607	Phường Cam Phúc Bắc	1664
410606	Phường Cam Phú	1664
410605	Phường Cam Nghĩa	1664
410604	Phường Cam Lợi	1664
410603	Phường Cam Lộc	1664
410602	Phường Cam Linh	1664
410601	Phường Ba Ngòi	1664
91590	Phường Tân Tiến	1548
410127	Xã Vĩnh Trung	1548
410126	Xã Vĩnh Thạnh	1548
410125	Xã Vĩnh Thái	1548
410124	Xã Vĩnh Phương	1548
410123	Xã Vĩnh Ngọc	1548
410122	Xã Vĩnh Lương	1548
410121	Xã Vĩnh Hiệp	1548
410120	Xã Phước Đồng	1548
410119	Phường Xương Huân	1548
410118	Phường Vĩnh Trường	1548
410117	Phường Vĩnh Thọ	1548
410116	Phường Vĩnh Phước	1548
410115	Phường Vĩnh Nguyên	1548
410114	Phường Vĩnh Hòa	1548
410113	Phường Vĩnh Hải	1548
410112	Phường Vạn Thạnh	1548
410111	Phường Vạn Thắng	1548
410110	Phường Tân Lập	1548
410109	Phường Phương Sơn	1548
410108	Phường Phương Sài	1548
410107	Phường Phước Tiến	1548
410106	Phường Phước Tân	1548
410105	Phường Phước Long	1548
410104	Phường Phước Hòa	1548
410103	Phường Phước Hải	1548
410102	Phường Ngọc Hiệp	1548
410101	Phường Lộc Thọ	1548
380312	Xã Lơ Pang	2165
380311	Xã Kon Thụp	2165
380310	Xã Kon Chiêng	2165
380309	Xã Hra	2165
380308	Xã Đê Ar	2165
380307	Xã Đăk Yă	2165
380306	Xã Đăk Trôi	2165
380305	Xã Đak Ta Ley	2165
380304	Xã Đak Jơ Ta	2165
380303	Xã Đăk Djrăng	2165
380302	Xã Ayun	2165
380301	Thị trấn Kon Dơng	2165
381114	Xã Uar	2152
381113	Xã Phú Cần	2152
381112	Xã Krông Năng	2152
381111	Xã Ia RSươm	2152
381110	Xã Ia RSai	2152
381109	Xã Ia RMok	2152
381108	Xã Ia Mláh	2152
381107	Xã Ia HDreh	2152
381106	Xã Đất Bằng	2152
381105	Xã Chư Rcăm	2152
381104	Xã Chư Ngọc	2152
381103	Xã Chư Gu	2152
381102	Xã Chư Drăng	2152
381101	Thị trấn Phú Túc	2152
380614	Xã Yang Trung	2149
380613	Xã Yang Nam	2149
380612	Xã Ya Ma	2149
380611	Xã SRó	2149
380610	Xã Kông Yang	2149
380609	Xã Đăk Tơ Pang	2149
380608	Xã Đăk Song	2149
380607	Xã Đăk Pơ Pho	2149
380606	Xã Đăk Pling	2149
380605	Xã Đắk Kơ Ning	2149
380604	Xã Chư Krêy	2149
380603	Xã Chơ Long	2149
380602	Xã An Trung	2149
380601	Thị trấn Kông Chro	2149
91592	Xã Kông Bơ La	2144
380414	Xã Tơ Tung	2144
380413	Xã Sơn Lang	2144
380412	Xã Sơ Pai	2144
380411	Xã Nghĩa An	2144
380410	Xã Lơ Ku	2144
380409	Xã KRong	2144
380408	Xã Kông Pla	2144
380407	Xã Kông Lơng Khơng	2144
380406	Xã Kon Pne	2144
380405	Xã Đông	2144
380404	Xã Đak SMar	2144
380403	Xã Đăk Roong	2144
380402	Xã Đăk HLơ	2144
380401	Thị trấn KBang	2144
381508	Xã Yang Bắc	2119
381507	Xã Ya Hội	2119
381506	Xã Tân An	2119
381505	Xã Phú An	2119
381504	Xã Hà Tam	2119
381503	Xã Cư An	2119
381502	Xã An Thành	2119
381501	Thị trấn Đak Pơ	2119
381317	Xã Trang	2118
381316	Xã Tân Bình	2118
381315	Xã Nam Yang	2118
381314	Xã Kon Gang	2118
381313	Xã K' Dang	2118
381312	Xã Ia Pết	2118
381311	Xã Ia Băng	2118
381310	Xã HNol	2118
381309	Xã Hải Yang	2118
381308	Xã Hà Đông	2118
381307	Xã Hà Bầu	2118
381306	Xã H' Neng	2118
381305	Xã Glar	2118
381304	Xã Đăk Sơmei	2118
381303	Xã Đăk Krong	2118
381302	Xã A Dơk	2118
381301	Thị trấn Đăk Đoa	2118
381709	Xã Ia Rong	2101
381708	Xã Ia Phang	2101
381707	Xã Ia Le	2101
381706	Xã Ia Hrú	2101
381705	Xã Ia Hla	2101
381704	Xã Ia Dreng	2101
381703	Xã Ia BLứ	2101
381702	Xã Chư Don	2101
381701	Thị trấn Nhơn Hoà	2101
380215	Xã Nghĩa Hưng	1801
380214	Xã Nghĩa Hòa	1801
380213	Xã Ia Phí	1801
380212	Xã Ia Nhin	1801
380211	Xã Ia Mơ Nông	1801
380210	Xã Ia Kreng	1801
380209	Xã Ia Khươl	1801
380208	Xã Ia Ka	1801
380207	Xã Hòa Phú	1801
380206	Xã Hà Tây	1801
380205	Xã Đăk Tơ Ver	1801
380204	Xã Chư Jôr	1801
380203	Xã Chư Đăng Ya	1801
380202	Thị trấn Phú Hòa	1801
380201	Thị trấn Ia Ly	1801
380511	Xã Xuân An	1800
380510	Xã Tú An	1800
380509	Xã Thành An	1800
380508	Xã Song An	1800
380507	Xã Cửu An	1800
380506	Phường Tây Sơn	1800
380505	Phường Ngô Mây	1800
380504	Phường An Tân	1800
380503	Phường An Phước	1800
380502	Phường An Phú	1800
380501	Phường An Bình	1800
381409	Xã Pờ Tó	1799
381408	Xã Kim Tân	1799
381407	Xã Ia Tul	1799
381406	Xã Ia Trok	1799
381405	Xã Ia Ma Rơn	1799
381404	Xã Ia KDăm	1799
381403	Xã Ia Broăi	1799
381402	Xã Chư Răng	1799
381401	Xã Chư Mố	1799
381008	Xã Ia Sao	1798
381007	Xã Ia RTô	1798
381006	Xã Ia RBol	1798
381005	Xã Chư Băh	1798
381004	Phường Sông Bờ	1798
381003	Phường Hòa Bình	1798
381002	Phường Đoàn Kết	1798
381001	Phường Cheo Reo	1798
381610	Xã Ia Yeng	1797
381609	Xã Ia Sol	1797
381608	Xã Ia Piar	1797
381607	Xã Ia Peng	1797
381606	Xã Ia Hiao	1797
381605	Xã Ia Ake	1797
381604	Xã Chư A Thai	1797
381603	Xã Chrôh Pơnan	1797
381602	Xã Ayun Hạ	1797
381601	Thị trấn Phú Thiện	1797
380915	Xã Kông HTok	1796
380914	Xã Ia Tiêm	1796
380913	Xã Ia Pal	1796
380912	Xã Ia Ko	1796
380911	Xã Ia HLốp	1796
380910	Xã Ia Glai	1796
380909	Xã Ia Blang	1796
380908	Xã H Bông	1796
380907	Xã Dun	1796
380906	Xã Chư Pơng	1796
380905	Xã Bờ Ngoong	1796
380904	Xã Bar Măih	1796
380903	Xã AYun	1796
380902	Xã AL Bá	1796
380901	Thị trấn Chư Sê	1796
380820	Xã Thăng Hưng	1795
380819	Xã Ia Vê	1795
380818	Xã Ia Tôr	1795
380817	Xã Ia Púch	1795
380816	Xã Ia Piơr	1795
380815	Xã Ia Pia	1795
380814	Xã Ia Phìn	1795
380813	Xã Ia O	1795
380812	Xã Ia Mơ	1795
380811	Xã Ia Me	1795
380810	Xã Ia Lâu	1795
380809	Xã Ia Kly	1795
380808	Xã Ia Ga	1795
380807	Xã Ia Drăng	1795
380806	Xã Ia Boòng	1795
380805	Xã Ia Băng	1795
380804	Xã Ia Bang	1795
380803	Xã Bình Giáo	1795
380802	Xã Bàu Cạn	1795
380801	Thị trấn Chư Prông	1795
380710	Xã Ia Pnôn	1794
380709	Xã Ia Nan	1794
380708	Xã Ia Lang	1794
380707	Xã Ia Kriêng	1794
380706	Xã Ia Krêl	1794
380705	Xã Ia Kla	1794
380704	Xã Ia Dom	1794
380703	Xã Ia Dơk	1794
380702	Xã Ia Din	1794
380701	Thị trấn Chư Ty	1794
381213	Xã Ia Yok	1793
381212	Xã Ia Tô	1793
381211	Xã Ia Sao	1793
381210	Xã Ia Pếch	1793
381209	Xã Ia O	1793
381208	Xã Ia KRai	1793
381207	Xã Ia Khai	1793
381206	Xã Ia Hrung	1793
381205	Xã Ia Grăng	1793
381204	Xã Ia Dêr	1793
381203	Xã Ia Chia	1793
381202	Xã Ia Bă	1793
381201	Thị trấn Ia Kha	1793
380123	Xã Trà Đa	1546
380122	Xã Tân Sơn	1546
380121	Xã Ia Kênh	1546
380120	Xã Gào	1546
380119	Xã Diên Phú	1546
380118	Xã Chư HDrông	1546
380117	Xã Chư Á	1546
380116	Xã Biển Hồ	1546
380115	Xã An Phú	1546
380114	Phường Yên Thế	1546
380113	Phường Yên Đỗ	1546
380112	Phường Trà Bá	1546
380111	Phường Thống Nhất	1546
380110	Phường Thắng Lợi	1546
380109	Phường Tây Sơn	1546
380108	Phường Phù Đổng	1546
380107	Phường Ia Kring	1546
380106	Phường Hội Thương	1546
380105	Phường Hội Phú	1546
380104	Phường Hoa Lư	1546
380103	Phường Đống Đa	1546
380102	Phường Diên Hồng	1546
380101	Phường Chi Lăng	1546
91622	Xã Láng Dài	3704
91621	Xã Long Tân	3704
91620	Thị trấn Phước Hải	3704
91619	Xã Phước Hội	3704
91618	Xã Phước Long Thọ	3704
91617	Thị trấn Đất Đỏ	3704
91616	Xã Phước Hưng	3704
91615	Xã Phước Tỉnh	3704
91614	Xã Tam An	3704
91613	Thị trấn Long Hải	3704
91612	Thị trấn Long Điền	3704
541305	Côn Đảo	2111
520716	Xã Xuân Sơn	1709
520715	Xã Xà Bang	1709
520714	Xã Suối Rao	1709
520713	Xã Suối Nghệ	1709
520712	Xã Sơn Bình	1709
520711	Xã Quảng Thành	1709
520710	Xã Nghĩa Thành	1709
520709	Xã Láng Lớn	1709
520708	Xã Kim Long	1709
520707	Xã Đá Bạc	1709
520706	Xã Cù Bị	1709
520705	Xã Bình Trung	1709
520704	Xã Bình Giã	1709
520703	Xã Bình Ba	1709
520702	Xã Bàu Chinh	1709
520701	Thị trấn Ngãi Giao	1709
520610	Xã Tóc Tiên	1701
520609	Phường Tân Phước	1701
520608	Xã Tân Hoà	1701
520607	Xã Tân Hải	1701
520606	Xã Sông Xoài	1701
520605	Phường Phước Hoà	1701
520604	Phường Mỹ Xuân	1701
520603	Phường Hắc Dịch	1701
520602	Xã Châu Pha	1701
520601	Phường Phú Mỹ	1701
520313	Xã Xuyên Mộc	1699
520312	Xã Tân Lâm	1699
520311	Xã Phước Thuận	1699
520310	Xã Phước Tân	1699
520309	Xã Hòa Hưng	1699
520308	Xã Hòa Hội	1699
520307	Xã Hòa Hiệp	1699
520306	Xã Hòa Bình	1699
520305	Xã Bưng Riềng	1699
520304	Xã Bông Trang	1699
520303	Xã Bình Châu	1699
520302	Xã Bàu Lâm	1699
520301	Thị trấn Phước Bửu	1699
520808	Xã Phước Long Thọ	1690
520807	Xã Phước Hội	1690
520806	Xã Long Tân	1690
520805	Xã Long Mỹ	1690
520804	Xã Lộc An	1690
520803	Xã Láng Dài	1690
520802	Thị trấn Phước Hải	1690
520801	Thị trấn Đất Đỏ	1690
520407	Xã Tam Phước	1689
520406	Xã Phước Tỉnh	1689
520405	Xã Phước Hưng	1689
520404	Xã An Nhứt	1689
520403	Xã An Ngãi	1689
520402	Thị trấn Long Hải	1689
520401	Thị trấn Long Điền	1689
520211	Xã Tân Hưng	1667
520210	Xã Long Phước	1667
520209	Xã Hoà Long	1667
520208	Phường Phước Trung	1667
520207	Phường Phước Nguyên	1667
520206	Phường Phước Hưng	1667
520205	Phường Phước Hiệp	1667
520204	Phường Long Toàn	1667
520203	Phường Long Tâm	1667
520202	Phường Long Hương	1667
520201	Phường Kim Dinh	1667
520117	Xã Long Sơn	1544
520116	Phường Thắng Tam	1544
520115	Phường Thắng Nhì	1544
520114	Phường Thắng Nhất	1544
520113	Phường Rạch Dừa	1544
520112	Phường Nguyễn An Ninh	1544
520111	Phường 9	1544
520110	Phường 8	1544
520109	Phường 7	1544
520108	Phường 5	1544
520107	Phường 4	1544
520106	Phường 3	1544
520105	Phường 2	1544
520104	Phường 12	1544
520103	Phường 11	1544
520102	Phường 10	1544
520101	Phường 1	1544
440910	Xã Thường Tân	3135
440909	Xã Tân Thành	3135
440908	Xã Tân Mỹ	3135
440907	Xã Tân Lập	3135
440906	Xã Tân Định	3135
440905	Xã Tân Bình	3135
440904	Xã Lạc An	3135
440903	Xã Hiếu Liêm	3135
440902	Xã Đất Cuốc	3135
440901	Xã Bình Mỹ	3135
440807	Xã Trừ Văn Thố	3132
440806	Xã Tân Hưng	3132
440805	Xã Long Nguyên	3132
440804	Xã Lai Uyên	3132
440803	Xã Lai Hưng	3132
440802	Xã Hưng Hòa	3132
440801	Xã Cây Trường II	3132
440611	Xã Vĩnh Hoà	1992
440610	Xã Tân Long	1992
440609	Xã Tân Hiệp	1992
440608	Xã Tam Lập	1992
440607	Xã Phước Sang	1992
440606	Xã Phước Hoà	1992
440605	Xã An Thái	1992
440604	Xã An Long	1992
440603	Xã An Linh	1992
440602	Xã An Bình	1992
440601	Thị trấn Phước Vĩnh	1992
440712	Xã Thanh Tuyền	1746
440711	Xã Thanh An	1746
440710	Xã Minh Thạnh	1746
440709	Xã Minh Tân	1746
440708	Xã Minh Hoà	1746
440707	Xã Long Tân	1746
440706	Xã Long Hoà	1746
440705	Xã Định Thành	1746
440704	Xã Định Hiệp	1746
440703	Xã Định An	1746
440702	Xã An Lập	1746
440701	Thị trấn Dầu Tiếng	1746
440208	Xã Phú An	1696
440207	Xã An Tây	1696
440206	Xã An Điền	1696
440205	Phường Thới Hòa	1696
440204	Phường Tân Định	1696
440203	Phường Mỹ Phước	1696
440202	Phường Hòa Lợi	1696
440201	Phường Chánh Phú Hòa	1696
440312	Xã Vĩnh Tân	1695
440311	Xã Thạnh Hội	1695
440310	Xã Tân Vĩnh Hiệp	1695
440309	Xã Phú Chánh	1695
440308	Xã Hội Nghĩa	1695
440307	Xã Bạch Đằng	1695
440306	Phường Uyên Hưng	1695
440305	Phường Thạnh Phước	1695
440304	Phường Thái Hòa	1695
440303	Phường Tân Phước Khánh	1695
440302	Phường Tân Hiệp	1695
440301	Phường Khánh Bình	1695
440410	Xã An Sơn	1541
440409	Phường Vĩnh Phú	1541
440408	Phường Thuận Giao	1541
440407	Phường Lái Thiêu	1541
440406	Phường Hưng Định	1541
440405	Phường Bình Nhâm	1541
440404	Phường Bình Hòa	1541
440403	Phường Bình Chuẩn	1541
440402	Phường An Thạnh	1541
440401	Phường An Phú	1541
440507	Phường Tân Đông Hiệp	1540
440506	Phường Tân Bình	1540
440505	Phường Đông Hòa	1540
440504	Phường Dĩ An	1540
440503	Phường Bình Thắng	1540
440502	Phường Bình An	1540
440501	Phường An Bình	1540
440114	Phường Tương Bình Hiệp	1538
440113	Phường Tân An	1538
440112	Phường Phú Thọ	1538
440111	Phường Phú Tân	1538
440110	Phường Phú Mỹ	1538
440109	Phường Phú Lợi	1538
440108	Phường Phú Hòa	1538
440107	Phường Phú Cường	1538
440106	Phường Hoà Phú	1538
440105	Phường Hiệp Thành	1538
440104	Phường Hiệp An	1538
440103	Phường Định Hoà	1538
440102	Phường Chánh Nghĩa	1538
440101	Phường Chánh Mỹ	1538
480212	Xã Vĩnh Tân	2049
480211	Xã Trị An	2049
480210	Xã Thiện Tân	2049
480209	Xã Thạnh Phú	2049
480208	Xã Tân Bình	2049
480207	Xã Tân An	2049
480206	Xã Phú Lý	2049
480205	Xã Mã Đà	2049
480204	Xã Hiếu Liêm	2049
480203	Xã Bình Lợi	2049
480202	Xã Bình Hòa	2049
480201	Thị trấn Vĩnh An	2049
480912	Xã Vĩnh Thanh	1708
480911	Xã Phước Thiền	1708
480910	Xã Phước Khánh	1708
480909	Xã Phước An	1708
480908	Xã Phú Thạnh	1708
480907	Xã Phú Hữu	1708
480906	Xã Phú Hội	1708
480905	Xã Phú Đông	1708
480904	Xã Long Thọ	1708
480903	Xã Long Tân	1708
480902	Xã Hiệp Phước	1708
480901	Xã Đại Phước	1708
800154	Thị Trấn Dầu Giây	1705
480510	Xã Xuân Thiện	1705
480509	Xã Xuân Thạnh	1705
480508	Xã Quang Trung	1705
480507	Xã Lộ 25	1705
480506	Xã Hưng Lộc	1705
480505	Xã Gia Tân 3	1705
480504	Xã Gia Tân 2	1705
480503	Xã Gia Tân 1	1705
480502	Xã Gia Kiệm	1705
480501	Xã Bàu Hàm 2	1705
480715	Xã Xuân Trường	1704
480714	Xã Xuân Thọ	1704
480713	Xã Xuân Thành	1704
480712	Xã Xuân Tâm	1704
480711	Xã Xuân Phú	1704
480710	Xã Xuân Hưng	1704
480709	Xã Xuân Hòa	1704
480708	Xã Xuân Hiệp	1704
480707	Xã Xuân Định	1704
480706	Xã Xuân Bắc	1704
480705	Xã Suối Cát	1704
480704	Xã Suối Cao	1704
480703	Xã Lang Minh	1704
480702	Xã Bảo Hoà	1704
480701	Thị trấn Gia Ray	1704
481113	Xã Xuân Tây	1702
481112	Xã Xuân Quế	1702
481111	Xã Xuân Mỹ	1702
481110	Xã Xuân Đường	1702
481109	Xã Xuân Đông	1702
481108	Xã Xuân Bảo	1702
481107	Xã Thừa Đức	1702
481106	Xã Sông Ray	1702
481105	Xã Sông Nhạn	1702
481104	Xã Nhân Nghĩa	1702
481103	Xã Long Giao	1702
481102	Xã Lâm San	1702
481101	Xã Bảo Bình	1702
480414	Xã Túc Trưng	1700
480413	Xã Thanh Sơn	1700
480412	Xã Suối Nho	1700
480411	Xã Phú Vinh	1700
480410	Xã Phú Túc	1700
480409	Xã Phú Tân	1700
480408	Xã Phú Ngọc	1700
480407	Xã Phú Lợi	1700
480406	Xã Phú Hòa	1700
480405	Xã Phú Cường	1700
480404	Xã Ngọc Định	1700
480403	Xã La Ngà	1700
480402	Xã Gia Canh	1700
480401	Thị trấn Định Quán	1700
480815	Xã Tân Hiệp	1694
480814	Xã Tam An	1694
480813	Xã Suối Trầu	1694
480812	Xã Phước Thái	1694
480811	Xã Phước Bình	1694
480810	Xã Long Phước	1694
480809	Xã Long Đức	1694
480808	Xã Long An	1694
480807	Xã Lộc An	1694
480806	Xã Cẩm Đường	1694
480805	Xã Bình Sơn	1694
480804	Xã Bình An	1694
480803	Xã Bàu Cạn	1694
480802	Xã An Phước	1694
480801	Thị trấn Long Thành	1694
480318	Xã Trà Cổ	1693
480317	Xã Thanh Sơn	1693
480316	Xã Tà Lài	1693
480315	Xã Phú Xuân	1693
480314	Xã Phú Trung	1693
480313	Xã Phú Thịnh	1693
480312	Xã Phú Thanh	1693
480311	Xã Phú Sơn	1693
480310	Xã Phú Lộc	1693
480309	Xã Phú Lập	1693
480308	Xã Phú Lâm	1693
480307	Xã Phú Điền	1693
480306	Xã Phú Bình	1693
480305	Xã Phú An	1693
480304	Xã Núi Tượng	1693
480303	Xã Nam Cát Tiên	1693
480302	Xã Dak Lua	1693
480301	Thị trấn Tân Phú	1693
480615	Xã Xuân Tân	1692
480614	Xã Xuân Lập	1692
480613	Xã Suối Tre	1692
480612	Xã Hàng Gòn	1692
480611	Xã Bình Lộc	1692
480610	Xã Bàu Trâm	1692
480609	Xã Bàu Sen	1692
480608	Xã Bảo Vinh	1692
480607	Xã Bảo Quang	1692
480606	Phường Xuân Trung	1692
480605	Phường Xuân Thanh	1692
480604	Phường Xuân Hoà	1692
480603	Phường Xuân Bình	1692
480602	Phường Xuân An	1692
480601	Phường Phú Bình	1692
481017	Xã Trung Hoà	1691
481016	Xã Thanh Bình	1691
481015	Xã Tây Hoà	1691
481014	Xã Sông Trầu	1691
481013	Xã Sông Thao	1691
481012	Xã Quảng Tiến	1691
481011	Xã Hưng Thịnh	1691
481010	Xã Hố Nai 3	1691
481009	Xã Giang Điền	1691
481008	Xã Đông Hoà	1691
481007	Xã Đồi 61	1691
481006	Xã Cây Gáo	1691
481005	Xã Bình Minh	1691
481004	Xã Bàu Hàm	1691
481003	Xã Bắc Sơn	1691
481002	Xã An Viễn	1691
481001	Thị trấn Trảng Bom	1691
480130	Xã Tân Hạnh	1536
480129	Xã Tam Phước	1536
480128	Xã Phước Tân	1536
480127	Xã Long Hưng	1536
480126	Phường Hóa An	1536
480125	Xã Hiệp Hòa	1536
480124	Xã An Hoà	1536
480123	Phường Trung Dũng	1536
480122	Phường Trảng Dài	1536
480121	Phường Thống Nhất	1536
480120	Phường Thanh Bình	1536
480119	Phường Tân Vạn	1536
480118	Phường Tân Tiến	1536
480117	Phường Tân Phong	1536
480116	Phường Tân Mai	1536
480115	Phường Tân Hòa	1536
480114	Phường Tân Hiệp	1536
480113	Phường Tân Biên	1536
480112	Phường Tam Hòa	1536
480111	Phường Tam Hiệp	1536
480110	Phường Quyết Thắng	1536
480109	Phường Quang Vinh	1536
480108	Phường Long Bình Tân	1536
480107	Phường Long Bình	1536
480106	Phường Hòa Bình	1536
480105	Phường Hố Nai	1536
480104	Phường Bửu Long	1536
480103	Phường Bửu Hòa	1536
480102	Phường Bình Đa	1536
480101	Phường An Bình	1536
541306	Hoàng Sa	2112
40611	Xã Hòa Tiến	1687
40610	Xã Hòa Sơn	1687
40609	Xã Hòa Phước	1687
40608	Xã Hòa Phú	1687
40607	Xã Hòa Phong	1687
40606	Xã Hòa Ninh	1687
40605	Xã Hòa Nhơn	1687
40604	Xã Hòa Liên	1687
40603	Xã Hòa Khương	1687
40602	Xã Hòa Châu	1687
40601	Xã Hòa Bắc	1687
40706	Phường Khuê Trung	1531
40705	Phường Hòa Xuân	1531
40704	Phường Hòa Thọ Tây	1531
40703	Phường Hòa Thọ Đông	1531
40702	Phường Hòa Phát	1531
40701	Phường Hòa An	1531
40505	Phường Hòa Minh	1530
40504	Phường Hòa Khánh Nam	1530
40503	Phường Hòa Khánh Bắc	1530
40502	Phường Hòa Hiệp Nam	1530
40501	Phường Hòa Hiệp Bắc	1530
40404	Phường Mỹ An	1529
40403	Phường Khuê Mỹ	1529
40402	Phường Hoà Quý	1529
40401	Phường Hoà Hải	1529
91580	Phường An Hải Nam	1528
40307	Phường Thọ Quang	1528
40306	Phường Phước Mỹ	1528
40305	Phường Nại Hiên Đông	1528
40304	Phường Mân Thái	1528
40303	Phường An Hải Tây	1528
40302	Phường An Hải Đông	1528
40301	Phường An Hải Bắc	1528
40210	Phường Xuân Hà	1527
40209	Phường Vĩnh Trung	1527
40208	Phường Thanh Khê Tây	1527
40207	Phường Thanh Khê Đông	1527
40206	Phường Thạc Gián	1527
40205	Phường Tân Chính	1527
40204	Phường Tam Thuận	1527
40203	Phường Hòa Khê	1527
40202	Phường Chính Gián	1527
40201	Phường An Khê	1527
91579	Phường Hải Châu	1526
40113	Phường Thuận Phước	1526
40112	Phường Thanh Bình	1526
40111	Phường Thạch Thang	1526
40110	Phường Phước Ninh	1526
40109	Phường Nam Dương	1526
40108	Phường Hòa Thuận Tây	1526
40107	Phường Hòa Thuận Đông	1526
40106	Phường Hòa Cường Nam	1526
40105	Phường Hòa Cường Bắc	1526
40104	Phường Hải Châu II	1526
40103	Phường Hải Châu  I	1526
40102	Phường Bình Thuận	1526
40101	Phường Bình Hiên	1526
90768	Phường An Khánh	3695
90767	Phường Bình Trưng Tây	3695
90766	Phường Bình Trưng Đông	3695
90765	Phường An Phú	3695
90764	Phường Thảo Điền	3695
90763	Phường Phú Hữu	3695
90762	Phường Phước Bình	3695
90761	Phường Long Trường	3695
90760	Phường Long Phước	3695
90759	Phường Trường Thạnh	3695
90758	Phường Phước Long B	3695
90757	Phường Phước Long A	3695
90756	Phường Tăng Nhơn Phú B	3695
90755	Phường Tăng Nhơn Phú A	3695
90754	Phường Hiệp Phú	3695
90753	Phường Tân Phú	3695
90752	Phường Long Thạnh Mỹ	3695
90751	Phường Long Bình	3695
90750	Phường Thủ Thiêm	3695
90749	Phường An Lợi Đông	3695
90748	Phường Thạnh Mỹ Lợi	3695
90747	Phường Cát Lái	3695
90746	Phường Trường Thọ	3695
90745	Phường Bình Thọ	3695
90744	Phường Linh Đông	3695
90743	Phường Linh Tây	3695
90742	Phường Linh Chiểu	3695
90741	Phường Hiệp Bình Chánh	3695
90740	Phường Hiệp Bình Phước	3695
90739	Phường Tam Phú	3695
90738	Phường Tam Bình	3695
90737	Phường Linh Trung	3695
90736	Phường Bình Chiểu	3695
90735	Phường Linh Xuân	3695
22407	Xã Thạnh An	2090
22406	Xã Tam Thôn Hiệp	2090
22405	Xã Lý Nhơn	2090
22404	Xã Long Hòa	2090
22403	Xã Bình Khánh	2090
22402	Xã An Thới Đông	2090
22401	Thị trấn Cần Thạnh	2090
22307	Xã Phước Lộc	1534
22306	Xã Phước Kiển	1534
22305	Xã Phú Xuân	1534
22304	Xã Nhơn Đức	1534
22303	Xã Long Thới	1534
22302	Xã Hiệp Phước	1534
22301	Thị trấn Nhà Bè	1534
22016	Xã Vĩnh Lộc B	1533
22015	Xã Vĩnh Lộc A	1533
22014	Xã Tân Quý Tây	1533
22013	Xã Tân Nhựt	1533
22012	Xã Tân Kiên	1533
22011	Xã Quy Đức	1533
22010	Xã Phong Phú	1533
22009	Xã Phạm Văn Hai	1533
22008	Xã Lê Minh Xuân	1533
22007	Xã Hưng Long	1533
22006	Xã Đa Phước	1533
22005	Xã Bình Lợi	1533
22004	Xã Bình Hưng	1533
22003	Xã Bình Chánh	1533
22002	Xã An Phú Tây	1533
22001	Thị trấn Tân Túc	1533
21812	Phường Trường Thọ	1463
21811	Phường Tam Phú	1463
21810	Phường Tam Bình	1463
21809	Phường Linh Xuân	1463
21808	Phường Linh Trung	1463
21807	Phường Linh Tây	1463
21806	Phường Linh Đông	1463
21805	Phường Linh Chiểu	1463
21804	Phường Hiệp Bình Phước	1463
21803	Phường Hiệp Bình Chánh	1463
21802	Phường Bình Thọ	1463
21801	Phường Bình Chiểu	1463
21620	Phường 28	1462
21619	Phường 27	1462
21618	Phường 26	1462
21617	Phường 25	1462
21616	Phường 24	1462
21615	Phường 22	1462
21614	Phường 21	1462
21613	Phường 19	1462
21612	Phường 17	1462
21611	Phường 15	1462
21610	Phường 14	1462
21609	Phường 13	1462
21608	Phường 12	1462
21607	Phường 11	1462
21606	Phường 7	1462
21605	Phường 6	1462
21604	Phường 5	1462
21603	Phường 3	1462
21602	Phường 2	1462
21601	Phường 1	1462
21316	Phường 9	1461
21315	Phường 8	1461
21314	Phường 6	1461
21313	Phường 17	1461
21312	Phường 16	1461
21311	Phường 15	1461
21310	Phường 14	1461
21309	Phường 13	1461
21308	Phường 12	1461
21307	Phường 11	1461
21306	Phường 10	1461
21305	Phường 7	1461
21304	Phường 5	1461
21303	Phường 4	1461
21302	Phường 3	1461
21301	Phường 1	1461
22121	Xã Trung Lập Thượng	1460
22120	Xã Trung Lập Hạ	1460
22119	Xã Trung An	1460
22118	Xã Thái Mỹ	1460
22117	Xã Tân Thông Hội	1460
22116	Xã Tân Thạnh Tây	1460
22115	Xã Tân Thạnh Đông	1460
22114	Xã Tân Phú Trung	1460
22113	Xã Tân An Hội	1460
22112	Xã Phước Vĩnh An	1460
22111	Xã Phước Thạnh	1460
22110	Xã Phước Hiệp	1460
22109	Xã Phú Mỹ Hưng	1460
22108	Xã Phú Hòa Đông	1460
22107	Xã Phạm Văn Cội	1460
22106	Xã Nhuận Đức	1460
22105	Xã Hòa Phú	1460
22104	Xã Bình Mỹ	1460
22103	Xã An Phú	1460
22102	Xã An Nhơn Tây	1460
22101	Thị trấn Củ Chi	1460
22212	Xã Xuân Thới Thượng	1459
22211	Xã Xuân Thới Sơn	1459
22210	Xã Xuân Thới Đông	1459
22209	Xã Trung Chánh	1459
22208	Xã Thới Tam Thôn	1459
22207	Xã Tân Xuân	1459
22206	Xã Tân Thới Nhì	1459
22205	Xã Tân Hiệp	1459
22204	Xã Nhị Bình	1459
22203	Xã Đông Thạnh	1459
22202	Xã Bà Điểm	1459
22201	Thị trấn Hóc Môn	1459
21910	Phường Tân Tạo A	1458
21909	Phường Tân Tạo	1458
21908	Phường Bình Trị Đông B	1458
21907	Phường Bình Trị Đông A	1458
21906	Phường Bình Trị Đông	1458
21905	Phường Bình Hưng Hoà B	1458
21904	Phường Bình Hưng Hoà A	1458
21903	Phường Bình Hưng Hòa	1458
21902	Phường An Lạc A	1458
21901	Phường  An Lạc	1458
21715	Phường 17	1457
21714	Phường 15	1457
21713	Phường 14	1457
21712	Phường 13	1457
21711	Phường 12	1457
21710	Phường 11	1457
21709	Phường 10	1457
21708	Phường 9	1457
21707	Phường 8	1457
21706	Phường 7	1457
21705	Phường 5	1457
21704	Phường 4	1457
21703	Phường 3	1457
21702	Phường 2	1457
21701	Phường 1	1457
21511	Phường Tây Thạnh	1456
21510	Phường Tân Thới Hòa	1456
21509	Phường Tân Thành	1456
21508	Phường Tân Sơn Nhì	1456
21507	Phường Tân Quý	1456
21506	Phường Sơn Kỳ	1456
21505	Phường Phú Trung	1456
21504	Phường Phú Thọ Hòa	1456
21503	Phường Phú Thạnh	1456
21502	Phường Hòa Thạnh	1456
21501	Phường Hiệp Tân	1456
21415	Phường 15	1455
21414	Phường 14	1455
21413	Phường 13	1455
21412	Phường 12	1455
21411	Phường 11	1455
21410	Phường 10	1455
21409	Phường 9	1455
21408	Phường 8	1455
21407	Phường 7	1455
21406	Phường 6	1455
21405	Phường 5	1455
21404	Phường 4	1455
21403	Phường 3	1455
21402	Phường 2	1455
21401	Phường 1	1455
21211	Phường Trung Mỹ Tây	1454
21210	Phường Thới An	1454
21209	Phường Thạnh Xuân	1454
21208	Phường Thạnh Lộc	1454
21207	Phường Tân Thới Nhất	1454
21206	Phường Tân Thới Hiệp	1454
21205	Phường Tân Hưng Thuận	1454
21204	Phường Tân Chánh Hiệp	1454
21203	Phường Hiệp Thành	1454
21202	Phường Đông Hưng Thuận	1454
21201	Phường An Phú Đông	1454
21116	Phường 16	1453
21115	Phường 15	1453
21114	Phường 14	1453
21113	Phường 13	1453
21112	Phường 12	1453
21111	Phường 11	1453
21110	Phường 10	1453
21109	Phường 9	1453
21108	Phường 8	1453
21107	Phường 7	1453
21106	Phường 6	1453
21105	Phường 5	1453
21104	Phường 4	1453
21103	Phường 3	1453
21102	Phường 2	1453
21101	Phường 1	1453
21015	Phường 15	1452
21014	Phường 14	1452
21013	Phường 13	1452
21012	Phường 12	1452
21011	Phường 11	1452
21010	Phường 10	1452
21009	Phường 9	1452
21008	Phường 8	1452
21007	Phường 7	1452
21006	Phường 6	1452
21005	Phường 5	1452
21004	Phường 4	1452
21003	Phường 3	1452
21002	Phường 2	1452
21001	Phường 1	1452
20913	Phường Trường Thạnh	1451
20912	Phường Tăng Nhơn Phú B	1451
20911	Phường Tăng Nhơn Phú A	1451
20910	Phường Tân Phú	1451
20909	Phường Phước Long B	1451
20908	Phường Phước Long A	1451
20907	Phường Phước Bình	1451
20906	Phường Phú Hữu	1451
20905	Phường Long Trường	1451
20904	Phường Long Thạnh Mỹ	1451
20903	Phường Long Phước	1451
20902	Phường Long Bình	1451
20901	Phường Hiệp Phú	1451
91625	Phường Xóm Củi	1450
91624	Phường Hưng Phú	1450
91623	Phường Rạch Ông	1450
20816	Phường 16	1450
20815	Phường 15	1450
20814	Phường 14	1450
20813	Phường 13	1450
20812	Phường 12	1450
20811	Phường 11	1450
20810	Phường 10	1450
20809	Phường 9	1450
20808	Phường 8	1450
20807	Phường 7	1450
20806	Phường 6	1450
20805	Phường 5	1450
20804	Phường 4	1450
20803	Phường 3	1450
20802	Phường 2	1450
20801	Phường 1	1450
20710	Phường Tân Thuận Tây	1449
20709	Phường Tân Thuận Đông	1449
20708	Phường Tân Quy	1449
20707	Phường Tân Phú	1449
20706	Phường Tân Phong	1449
20705	Phường Tân Kiểng	1449
20704	Phường Tân Hưng	1449
20703	Phường Phú Thuận	1449
20702	Phường Phú Mỹ	1449
20701	Phường Bình Thuận	1449
20614	Phường 14	1448
20613	Phường 13	1448
20612	Phường 12	1448
20611	Phường 11	1448
20610	Phường 10	1448
20609	Phường 9	1448
20608	Phường 8	1448
20607	Phường 7	1448
20606	Phường 6	1448
20605	Phường 5	1448
20604	Phường 4	1448
20603	Phường 3	1448
20602	Phường 2	1448
20601	Phường 1	1448
20515	Phường 15	1447
20514	Phường 14	1447
20513	Phường 13	1447
20512	Phường 12	1447
20511	Phường 11	1447
20510	Phường 10	1447
20509	Phường 9	1447
20508	Phường 8	1447
20507	Phường 7	1447
20506	Phường 6	1447
20505	Phường 5	1447
20504	Phường 4	1447
20503	Phường 3	1447
20502	Phường 2	1447
20501	Phường 1	1447
20415	Phường 18	1446
20414	Phường 16	1446
20413	Phường 15	1446
20412	Phường 14	1446
20411	Phường 13	1446
20410	Phường 12	1446
20409	Phường 10	1446
20408	Phường 9	1446
20407	Phường 8	1446
20406	Phường 6	1446
20405	Phường 5	1446
20404	Phường 4	1446
20403	Phường 3	1446
20402	Phường 2	1446
20401	Phường 1	1446
90795	Phường Võ Thị Sáu	1444
20314	Phường 14	1444
20313	Phường 13	1444
20312	Phường 12	1444
20311	Phường 11	1444
20310	Phường 10	1444
20309	Phường 9	1444
20308	Phường 8	1444
20307	Phường 7	1444
20306	Phường 6	1444
20305	Phường 5	1444
20304	Phường 4	1444
20303	Phường 3	1444
20302	Phường 2	1444
20301	Phường 1	1444
20211	Phường Thủ Thiêm	1443
20210	Phường Thảo Điền	1443
20209	Phường Thạnh Mỹ Lợi	1443
20208	Phường Cát Lái	1443
20207	Phường Bình Trưng Tây	1443
20206	Phường Bình Trưng Đông	1443
20205	Phường Bình Khánh	1443
20204	Phường Bình An	1443
20203	Phường An Phú	1443
20202	Phường An Lợi Đông	1443
20201	Phường An Khánh	1443
20110	Phường Tân Định	1442
20109	Phường Phạm Ngũ Lão	1442
20108	Phường Nguyễn Thái Bình	1442
20107	Phường Nguyễn Cư Trinh	1442
20106	Phường Đa Kao	1442
20105	Phường Cô Giang	1442
20104	Phường Cầu Ông Lãnh	1442
20103	Phường Cầu Kho	1442
20102	Phường Bến Thành	1442
20101	Phường Bến Nghé	1442
13010	Phường Xuân Phương	3440
13009	Phường Trung Văn	3440
13008	Phường Tây Mỗ	3440
13007	Phường Phương Canh	3440
13006	Phường Phú Đô	3440
13005	Phường Mỹ Đình 2	3440
13004	Phường Mỹ Đình 1	3440
13003	Phường Mễ Trì	3440
13002	Phường Đại Mỗ	3440
13001	Phường Cầu Diễn	3440
91275	Xã Vạn Nhất	3303
1B2729	Xã Văn Tự	3303
1B2728	Xã Vân Tảo	3303
1B2727	Xã Văn Phú	3303
1B2726	Xã Vạn Điểm	3303
1B2725	Xã Văn Bình	3303
1B2724	Xã Tự Nhiên	3303
1B2723	Xã Tô Hiệu	3303
1B2722	Xã Tiền Phong	3303
1B2721	Xã Thư Phú	3303
1B2720	Xã Thống Nhất	3303
1B2719	Xã Thắng Lợi	3303
1B2718	Xã Tân Minh	3303
1B2717	Xã Quất Động	3303
1B2716	Xã Ninh Sở	3303
1B2715	Xã Nhị Khê	3303
1B2714	Xã Nguyễn Trãi	3303
1B2713	Xã Nghiêm Xuyên	3303
1B2712	Xã Minh Cường	3303
1B2711	Xã Liên Phương	3303
1B2710	Xã Lê Lợi	3303
1B2709	Xã Khánh Hà	3303
1B2708	Xã Hồng Vân	3303
1B2707	Xã Hòa Bình	3303
1B2706	Xã Hiền Giang	3303
1B2705	Xã Hà Hồi	3303
1B2704	Xã Duyên Thái	3303
1B2703	Xã Dũng Tiến	3303
1B2702	Xã Chương Dương	3303
1B2701	Thị trấn Thường Tín	3303
91276	Xã Quang Hà	3255
800214	Xã Nam Tiến	3255
1B2828	Xã Vân Từ	3255
1B2827	Xã Văn Nhân	3255
1B2826	Xã Văn Hoàng	3255
1B2825	Xã Tri Trung	3255
1B2824	Xã Tri Thủy	3255
1B2823	Xã Thụy Phú	3255
1B2822	Xã Tân Dân	3255
1B2821	Xã Sơn Hà	3255
1B2820	Xã Quang Trung	3255
1B2819	Xã Quang Lãng	3255
1B2818	Xã Phượng Dực	3255
1B2817	Xã Phúc Tiến	3255
1B2816	Xã Phú Yên	3255
1B2815	Xã Phú Túc	3255
1B2814	Xã Nam Triều	3255
1B2813	Xã Nam Phong	3255
1B2812	Xã Minh Tân	3255
1B2811	Xã Khai Thái	3255
1B2810	Xã Hồng Thái	3255
1B2809	Xã Hồng Minh	3255
1B2808	Xã Hoàng Long	3255
1B2807	Xã Đại Xuyên	3255
1B2806	Xã Đại Thắng	3255
1B2805	Xã Chuyên Mỹ	3255
1B2804	Xã Châu Can	3255
1B2803	Xã Bạch Hạ	3255
1B2802	Thị trấn Phú Xuyên	3255
1B2801	Thị trấn Phú Minh	3255
91269	Xã Hưng Đạo	2004
91268	Xã Liệp Nghĩa	2004
91267	Xã Phượng Sơn	2004
1B2021	Xã Yên Sơn	2004
1B2020	Xã Tuyết Nghĩa	2004
1B2019	Xã Thạch Thán	2004
1B2018	Xã Tân Phú	2004
1B2017	Xã Tân Hòa	2004
1B2016	Xã Sài Sơn	2004
1B2015	Xã Phượng Cách	2004
1B2014	Xã Phú Mãn	2004
1B2013	Xã Phú Cát	2004
1B2012	Xã Ngọc Mỹ	2004
1B2011	Xã Ngọc Liệp	2004
1B2010	Xã Nghĩa Hương	2004
1B2009	Xã Liệp Tuyết	2004
1B2008	Xã Hòa Thạch	2004
1B2007	Xã Đông Yên	2004
1B2006	Xã Đông Xuân	2004
1B2005	Xã Đồng Quang	2004
1B2004	Xã Đại Thành	2004
1B2003	Xã Cộng Hòa	2004
1B2002	Xã Cấn Hữu	2004
1B2001	Thị trấn Quốc Oai	2004
91273	Xã Hòa Phú	1915
91272	Xã Hồng Phú	1915
1B2132	Xã Văn Võ	1915
1B2131	Xã Trường Yên	1915
1B2130	Xã Trung Hòa	1915
1B2129	Xã Trần Phú	1915
1B2128	Xã Tốt Động	1915
1B2127	Xã Tiên Phương	1915
1B2126	Xã Thủy Xuân Tiên	1915
1B2125	Xã Thụy Hương	1915
1B2124	Xã Thượng Vực	1915
1B2123	Xã Thanh Bình	1915
1B2122	Xã Tân Tiến	1915
1B2121	Xã Quảng Bị	1915
1B2120	Xã Phụng Châu	1915
1B2119	Xã Phú Nghĩa	1915
1B2118	Xã Phú Nam An	1915
1B2117	Xã Ngọc Hòa	1915
1B2116	Xã Nam Phương Tiến	1915
1B2115	Xã Mỹ Lương	1915
1B2114	Xã Lam Điền	1915
1B2113	Xã Hữu Văn	1915
1B2112	Xã Hợp Đồng	1915
1B2111	Xã Hồng Phong	1915
1B2110	Xã Hoàng Văn Thụ	1915
1B2109	Xã Hoàng Diệu	1915
1B2108	Xã Hòa Chính	1915
1B2107	Xã Đông Sơn	1915
1B2106	Xã Đông Phương Yên	1915
1B2105	Xã Đồng Phú	1915
1B2104	Xã Đồng Lạc	1915
1B2103	Xã Đại Yên	1915
1B2102	Thị trấn Xuân Mai	1915
1B2101	Thị trấn Chúc Sơn	1915
91280	Xã Bình Lưu Quang	1810
91279	Xã Thái Hòa	1810
91278	Xã Cao Sơn Tiến	1810
91277	Xã Hoa Viên	1810
1B2629	Xã Viên Nội	1810
1B2628	Xã Viên An	1810
1B2627	Xã Vạn Thái	1810
1B2626	Xã Trường Thịnh	1810
1B2625	Xã Trung Tú	1810
1B2624	Xã Trầm Lộng	1810
1B2623	Xã Tảo Dương Văn	1810
1B2622	Xã Sơn Công	1810
1B2621	Xã Quảng Phú Cầu	1810
1B2620	Xã Phương Tú	1810
1B2619	Xã Phù Lưu	1810
1B2618	Xã Minh Đức	1810
1B2617	Xã Lưu Hoàng	1810
1B2616	Xã Liên Bạt	1810
1B2615	Xã Kim Đường	1810
1B2614	Xã Hồng Quang	1810
1B2613	Xã Hòa Xá	1810
1B2612	Xã Hoa Sơn	1810
1B2611	Xã Hòa Phú	1810
1B2610	Xã Hòa Nam	1810
1B2609	Xã Hòa Lâm	1810
1B2608	Xã Đồng Tiến	1810
1B2607	Xã Đồng Tân	1810
1B2606	Xã Đông Lỗ	1810
1B2605	Xã Đội Bình	1810
1B2604	Xã Đại Hùng	1810
1B2603	Xã Đại Cường	1810
1B2602	Xã Cao Thành	1810
1B2601	Thị trấn Vân Đình	1810
91274	Xã Cao Xuân Dương	1809
1B2421	Xã Xuân Dương	1809
1B2420	Xã Thanh Văn	1809
1B2419	Xã Thanh Thùy	1809
1B2418	Xã Thanh Mai	1809
1B2417	Xã Thanh Cao	1809
1B2416	Xã Tân Ước	1809
1B2415	Xã Tam Hưng	1809
1B2414	Xã Phương Trung	1809
1B2413	Xã Mỹ Hưng	1809
1B2412	Xã Liên Châu	1809
1B2411	Xã Kim Thư	1809
1B2410	Xã Kim An	1809
1B2409	Xã Hồng Dương	1809
1B2408	Xã Đỗ Động	1809
1B2407	Xã Dân Hòa	1809
1B2406	Xã Cự Khê	1809
1B2405	Xã Cao Viên	1809
1B2404	Xã Cao Dương	1809
1B2403	Xã Bình Minh	1809
1B2402	Xã Bích Hòa	1809
1B2401	Thị trấn Kim Bài	1809
91271	Xã Quang Trung	1808
91270	Xã Lam Sơn	1808
1B1923	Xã Yên Trung	1808
1B1922	Xã Yên Bình	1808
1B1921	Xã Tiến Xuân	1808
1B1920	Xã Thạch Xá	1808
1B1919	Xã Thạch Hoà	1808
1B1918	Xã Tân Xã	1808
1B1917	Xã Phùng Xá	1808
1B1916	Xã Phú Kim	1808
1B1915	Xã Lại Thượng	1808
1B1914	Xã Kim Quan	1808
1B1913	Xã Hữu Bằng	1808
1B1912	Xã Hương Ngải	1808
1B1911	Xã Hạ Bằng	1808
1B1910	Xã Đồng Trúc	1808
1B1909	Xã Dị Nậu	1808
1B1908	Xã Đại Đồng	1808
1B1907	Xã Chàng Sơn	1808
1B1906	Xã Canh Nậu	1808
1B1905	Xã Cần Kiệm	1808
1B1904	Xã Cẩm Yên	1808
1B1903	Xã Bình Yên	1808
1B1902	Xã Bình Phú	1808
1B1901	Thị trấn Liên Quan	1808
91266	Xã Long Thượng	1807
91265	Xã Tích Lộc	1807
91264	Xã Nam Hà	1807
800213	Xã Sen Phương	1807
800212	Xã Xuân Đình	1807
1B1823	Xã Xuân Phú	1807
1B1822	Xã Võng Xuyên	1807
1B1821	Xã Vân Phúc	1807
1B1820	Xã Vân Nam	1807
1B1819	Xã Vân Hà	1807
1B1818	Xã Trạch Mỹ Lộc	1807
1B1817	Xã Tích Giang	1807
1B1816	Xã Thượng Cốc	1807
1B1815	Xã Thọ Lộc	1807
1B1814	Xã Thanh Đa	1807
1B1813	Xã Tam Thuấn	1807
1B1812	Xã Tam Hiệp	1807
1B1811	Xã Sen Chiểu	1807
1B1810	Xã Phương Độ	1807
1B1809	Xã Phụng Thượng	1807
1B1808	Xã Phúc Hòa	1807
1B1807	Xã Ngọc Tảo	1807
1B1806	Xã Long Xuyên	1807
1B1805	Xã Liên Hiệp	1807
1B1804	Xã Hiệp Thuận	1807
1B1803	Xã Hát Môn	1807
1B1802	Xã Cẩm Đình	1807
1B1801	Thị trấn Phúc Thọ	1807
91282	Xã Vạn Tín	1806
91281	Xã Mỹ Xuyên	1806
1B2522	Xã Xuy Xá	1806
1B2521	Xã Vạn Kim	1806
1B2520	Xã Tuy Lai	1806
1B2519	Xã Thượng Lâm	1806
1B2518	Xã Phùng Xá	1806
1B2517	Xã Phúc Lâm	1806
1B2516	Xã Phù Lưu Tế	1806
1B2515	Xã Mỹ Thành	1806
1B2514	Xã Lê Thanh	1806
1B2513	Xã Hương Sơn	1806
1B2512	Xã Hùng Tiến	1806
1B2511	Xã Hợp Tiến	1806
1B2510	Xã Hợp Thanh	1806
1B2509	Xã Hồng Sơn	1806
1B2508	Xã Đồng Tâm	1806
1B2507	Xã Đốc Tín	1806
1B2506	Xã Đại Hưng	1806
1B2505	Xã Bột Xuyên	1806
1B2504	Xã An Tiến	1806
1B2503	Xã An Phú	1806
1B2502	Xã An Mỹ	1806
1B2501	Thị trấn Đại Nghĩa	1806
1B2320	Xã Yên Sở	1805
1B2319	Xã Vân Côn	1805
1B2318	Xã Vân Canh	1805
1B2317	Xã Tiền Yên	1805
1B2316	Xã Song Phương	1805
1B2315	Xã Sơn Đồng	1805
1B2314	Xã Minh Khai	1805
1B2313	Xã Lại Yên	1805
1B2312	Xã La Phù	1805
1B2311	Xã Kim Chung	1805
1B2310	Xã Dương Liễu	1805
1B2309	Xã Đức Thượng	1805
1B2308	Xã Đức Giang	1805
1B2307	Xã Đông La	1805
1B2306	Xã Di Trạch	1805
1B2305	Xã Đắc Sở	1805
1B2304	Xã Cát Quế	1805
1B2303	Xã An Thượng	1805
1B2302	Xã An Khánh	1805
1B2301	Thị trấn Trạm Trôi	1805
1B2216	Xã Trung Châu	1804
1B2215	Xã Thượng Mỗ	1804
1B2214	Xã Thọ Xuân	1804
1B2213	Xã Thọ An	1804
1B2212	Xã Tân Lập	1804
1B2211	Xã Tân Hội	1804
1B2210	Xã Song Phượng	1804
1B2209	Xã Phương Đình	1804
1B2208	Xã Liên Trung	1804
1B2207	Xã Liên Hồng	1804
1B2206	Xã Liên Hà	1804
1B2205	Xã Hồng Hà	1804
1B2204	Xã Hạ Mỗ	1804
1B2203	Xã Đồng Tháp	1804
1B2202	Xã Đan Phượng	1804
1B2201	Thị trấn Phùng	1804
91263	Xã Phú Hồng	1803
1B1731	Xã Yên Bài	1803
1B1730	Xã Vật Lại	1803
1B1729	Xã Vạn Thắng	1803
1B1728	Xã Vân Hòa	1803
1B1727	Xã Tòng Bạt	1803
1B1726	Xã Tiên Phong	1803
1B1725	Xã Thụy An	1803
1B1724	Xã Thuần Mỹ	1803
1B1723	Xã Thái Hòa	1803
1B1722	Xã Tản Lĩnh	1803
1B1721	Xã Tản Hồng	1803
1B1720	Xã Sơn Đà	1803
1B1719	Xã Phú Sơn	1803
1B1718	Xã Phú Phương	1803
1B1717	Xã Phú Đông	1803
1B1716	Xã Phú Cường	1803
1B1715	Xã Phú Châu	1803
1B1714	Xã Phong Vân	1803
1B1713	Xã Minh Quang	1803
1B1712	Xã Minh Châu	1803
1B1711	Xã Khánh Thượng	1803
1B1710	Xã Đồng Thái	1803
1B1709	Xã Đông Quang	1803
1B1708	Xã Cổ Đô	1803
1B1707	Xã Chu Minh	1803
1B1706	Xã Châu Sơn	1803
1B1705	Xã Cam Thượng	1803
1B1704	Xã Cẩm Lĩnh	1803
1B1703	Xã Ba Vì	1803
1B1702	Xã Ba Trại	1803
1B1701	Thị trấn Tây Đằng	1803
1B1615	Xã Xuân Sơn	1711
1B1614	Xã Thanh Mỹ	1711
1B1613	Xã Sơn Đông	1711
1B1612	Xã Kim Sơn	1711
1B1611	Xã Đường Lâm	1711
1B1610	Xã Cổ Đông	1711
1B1609	Phường Xuân Khanh	1711
1B1608	Phường Viên Sơn	1711
1B1607	Phường Trung Sơn Trầm	1711
1B1606	Phường Trung Hưng	1711
1B1605	Phường Sơn Lộc	1711
1B1604	Phường Quang Trung	1711
1B1603	Phường Phú Thịnh	1711
1B1602	Phường Ngô Quyền	1711
1B1601	Phường Lê Lợi	1711
1A1116	Xã Yên Mỹ	1710
1A1115	Xã Vĩnh Quỳnh	1710
1A1114	Xã Vạn Phúc	1710
1A1113	Xã Tứ Hiệp	1710
1A1112	Xã Thanh Liệt	1710
1A1111	Xã Tân Triều	1710
1A1110	Xã Tam Hiệp	1710
1A1109	Xã Tả Thanh Oai	1710
1A1108	Xã Ngũ Hiệp	1710
1A1107	Xã Ngọc Hồi	1710
1A1106	Xã Liên Ninh	1710
1A1105	Xã Hữu Hoà	1710
1A1104	Xã Duyên Hà	1710
1A1103	Xã Đông Mỹ	1710
1A1102	Xã Đại áng	1710
1A1101	Thị trấn Văn Điển	1710
91262	Xã Kim Đức	1703
91261	Xã Phú Sơn	1703
91260	Xã Thiên Đức	1703
1A1222	Xã Yên Viên	1703
1A1221	Xã Yên Thường	1703
1A1220	Xã Văn Đức	1703
1A1219	Xã Trung Mầu	1703
1A1218	Xã Phú Thị	1703
1A1217	Xã Phù Đổng	1703
1A1216	Xã Ninh Hiệp	1703
1A1215	Xã Lệ Chi	1703
1A1214	Xã Kim Sơn	1703
1A1213	Xã Kim Lan	1703
1A1212	Xã Kiêu Kỵ	1703
1A1211	Xã Dương Xá	1703
1A1210	Xã Dương Quang	1703
1A1209	Xã Dương Hà	1703
1A1208	Xã Đông Dư	1703
1A1207	Xã Đình Xuyên	1703
1A1206	Xã Đặng Xá	1703
1A1205	Xã Đa Tốn	1703
1A1204	Xã Cổ Bi	1703
1A1203	Xã Bát Tràng	1703
1A1202	Thị trấn Yên Viên	1703
1A1201	Thị trấn Trâu Quỳ	1703
1A1426	Xã Xuân Thu	1583
1A1425	Xã Xuân Giang	1583
1A1424	Xã Việt Long	1583
1A1423	Xã Trung Giã	1583
1A1422	Xã Tiên Dược	1583
1A1421	Xã Thanh Xuân	1583
1A1420	Xã Tân Minh	1583
1A1419	Xã Tân Hưng	1583
1A1418	Xã Tân Dân	1583
1A1417	Xã Quang Tiến	1583
1A1416	Xã Phú Minh	1583
1A1415	Xã Phù Lỗ	1583
1A1414	Xã Phù Linh	1583
1A1413	Xã Phú Cường	1583
1A1412	Xã Nam Sơn	1583
1A1411	Xã Minh Trí	1583
1A1410	Xã Minh Phú	1583
1A1409	Xã Mai Đình	1583
1A1408	Xã Kim Lũ	1583
1A1407	Xã Hồng Kỳ	1583
1A1406	Xã Hiền Ninh	1583
1A1405	Xã Đức Hoà	1583
1A1404	Xã Đông Xuân	1583
1A1403	Xã Bắc Sơn	1583
1A1402	Xã Bắc Phú	1583
1A1401	Thị trấn Sóc Sơn	1583
1A1324	Xã Xuân Nộn	1582
1A1323	Xã Xuân Canh	1582
1A1322	Xã Võng La	1582
1A1321	Xã Vĩnh Ngọc	1582
1A1320	Xã Việt Hùng	1582
1A1319	Xã Vân Nội	1582
1A1318	Xã Vân Hà	1582
1A1317	Xã Uy Nỗ	1582
1A1316	Xã Tiên Dương	1582
1A1315	Xã Thuỵ Lâm	1582
1A1314	Xã Tầm Xá	1582
1A1313	Xã Nguyên Khê	1582
1A1312	Xã Nam Hồng	1582
1A1311	Xã Mai Lâm	1582
1A1310	Xã Liên Hà	1582
1A1309	Xã Kim Nỗ	1582
1A1308	Xã Kim Chung	1582
1A1307	Xã Hải Bối	1582
1A1306	Xã Dục Tú	1582
1A1305	Xã Đông Hội	1582
1A1304	Xã Đại Mạch	1582
1A1303	Xã Cổ Loa	1582
1A1302	Xã Bắc Hồng	1582
1A1301	Thị trấn Đông Anh	1582
1B2918	Xã Vạn Yên	1581
1B2917	Xã Văn Khê	1581
1B2916	Xã Tự Lập	1581
1B2915	Xã Tráng Việt	1581
1B2914	Xã Tiến Thịnh	1581
1B2913	Xã Tiến Thắng	1581
1B2912	Xã Tiền Phong	1581
1B2911	Xã Thanh Lâm	1581
1B2910	Xã Thạch Đà	1581
1B2909	Xã Tam Đồng	1581
1B2908	Xã Mê Linh	1581
1B2907	Xã Liên Mạc	1581
1B2906	Xã Kim Hoa	1581
1B2905	Xã Hoàng Kim	1581
1B2904	Xã Đại Thịnh	1581
1B2903	Xã Chu Phan	1581
1B2902	Thị trấn Quang Minh	1581
1B2901	Thị trấn Chi Đông	1581
1B1517	Phường Yết Kiêu	1542
1B1516	Phường Yên Nghĩa	1542
1B1515	Phường Văn Quán	1542
1B1514	Phường Vạn Phúc	1542
1B1513	Phường Quang Trung	1542
1B1512	Phường Phúc La	1542
1B1511	Phường Phú Lương	1542
1B1510	Phường Phú Lãm	1542
1B1509	Phường Phú La	1542
1B1508	Phường Nguyễn Trãi	1542
1B1507	Phường Mộ Lao	1542
1B1506	Phường La Khê	1542
1B1505	Phường Kiến Hưng	1542
1B1504	Phường Hà Cầu	1542
1B1503	Phường Dương Nội	1542
1B1502	Phường Đồng Mai	1542
1B1501	Phường Biên Giang	1542
1A0711	Phường Thượng Đình	1493
1A0710	Phường Thanh Xuân Trung	1493
1A0709	Phường Thanh Xuân Nam	1493
1A0708	Phường Thanh Xuân Bắc	1493
1A0707	Phường Phương Liệt	1493
1A0706	Phường Nhân Chính	1493
1A0705	Phường Kim Giang	1493
1A0704	Phường Khương Trung	1493
1A0703	Phường Khương Mai	1493
1A0702	Phường Khương Đình	1493
1A0701	Phường Hạ Đình	1493
1A0508	Phường Yên Phụ	1492
1A0507	Phường Xuân La	1492
1A0506	Phường Tứ Liên	1492
1A0505	Phường Thụy Khuê	1492
1A0504	Phường Quảng An	1492
1A0503	Phường Phú Thượng	1492
1A0502	Phường Nhật Tân	1492
1A0501	Phường Bưởi	1492
1A0914	Phường Việt Hưng	1491
1A0913	Phường Thượng Thanh	1491
1A0912	Phường Thạch Bàn	1491
1A0911	Phường Sài Đồng	1491
1A0910	Phường Phúc Lợi	1491
1A0909	Phường Phúc Đồng	1491
1A0908	Phường Ngọc Thụy	1491
1A0907	Phường Ngọc Lâm	1491
1A0906	Phường Long Biên	1491
1A0905	Phường Giang Biên	1491
1A0904	Phường Gia Thụy	1491
1A0903	Phường Đức Giang	1491
1A0902	Phường Cự Khối	1491
1A0901	Phường Bồ Đề	1491
1A0814	Phường Yên Sở	1490
1A0813	Phường Vĩnh Hưng	1490
1A0812	Phường Tương Mai	1490
1A0811	Phường Trần Phú	1490
1A0810	Phường Thịnh Liệt	1490
1A0809	Phường Thanh Trì	1490
1A0808	Phường Tân Mai	1490
1A0807	Phường Mai Động	1490
1A0806	Phường Lĩnh Nam	1490
1A0805	Phường Hoàng Văn Thụ	1490
1A0804	Phường Hoàng Liệt	1490
1A0803	Phường Giáp Bát	1490
1A0802	Phường Định Công	1490
1A0801	Phường Đại Kim	1490
1A0218	Phường Tràng Tiền	1489
1A0217	Phường Trần Hưng Đạo	1489
1A0216	Phường Phúc Tân	1489
1A0215	Phường Phan Chu Trinh	1489
1A0214	Phường Lý Thái Tổ	1489
1A0213	Phường Hàng Trống	1489
1A0212	Phường Hàng Mã	1489
1A0211	Phường Hàng Gai	1489
1A0210	Phường Hàng Đào	1489
1A0209	Phường Hàng Buồm	1489
1A0208	Phường Hàng Bông	1489
1A0207	Phường Hàng Bồ	1489
1A0206	Phường Hàng Bài	1489
1A0205	Phường Hàng Bạc	1489
1A0204	Phường Đồng Xuân	1489
1A0203	Phường Cửa Nam	1489
1A0202	Phường Cửa Đông	1489
1A0201	Phường Chương Dương	1489
1A0320	Phường Vĩnh Tuy	1488
1A0319	Phường Trương Định	1488
1A0318	Phường Thanh Nhàn	1488
1A0317	Phường Thanh Lương	1488
1A0316	Phường Quỳnh Mai	1488
1A0315	Phường Quỳnh Lôi	1488
1A0314	Phường Phố Huế	1488
1A0313	Phường Phạm Đình Hổ	1488
1A0312	Phường Nguyễn Du	1488
1A0311	Phường Ngô Thì Nhậm	1488
1A0310	Phường Minh Khai	1488
1A0309	Phường Lê Đại Hành	1488
1A0308	Phường Đồng Tâm	1488
1A0307	Phường Đồng Nhân	1488
1A0306	Phường Đống Mác	1488
1A0305	Phường Cầu Dền	1488
1A0304	Phường Bùi Thị Xuân	1488
1A0303	Phường Bạch Mai	1488
1A0302	Phường Bách Khoa	1488
1A0301	Phường Bạch Đằng	1488
91259	Phường Phương Liên - Trung Tự	1486
91258	Phường Văn Miếu - Quốc Tử Giám	1486
1A0421	Phường Văn Miếu	1486
1A0420	Phường Văn Chương	1486
1A0419	Phường Trung Tự	1486
1A0418	Phường Trung Phụng	1486
1A0417	Phường Trung Liệt	1486
1A0416	Phường Thổ Quan	1486
1A0415	Phường Thịnh Quang	1486
1A0414	Phường Quốc Tử Giám	1486
1A0413	Phường Quang Trung	1486
1A0412	Phường Phương Mai	1486
1A0411	Phường Phương Liên	1486
1A0410	Phường Ô Chợ Dừa	1486
1A0409	Phường Ngã Tư Sở	1486
1A0408	Phường Nam Đồng	1486
1A0407	Phường Láng Thượng	1486
1A0406	Phường Láng Hạ	1486
1A0405	Phường Kim Liên	1486
1A0404	Phường Khương Thượng	1486
1A0403	Phường Khâm Thiên	1486
1A0402	Phường Hàng Bột	1486
1A0401	Phường Cát Linh	1486
1A0608	Phường Yên Hoà	1485
1A0607	Phường Trung Hoà	1485
1A0606	Phường Quan Hoa	1485
1A0605	Phường Nghĩa Tân	1485
1A0604	Phường Nghĩa Đô	1485
1A0603	Phường Mai Dịch	1485
1A0602	Phường Dịch Vọng Hậu	1485
1A0601	Phường Dịch Vọng	1485
1A0114	Phường Vĩnh Phúc	1484
1A0113	Phường Trúc Bạch	1484
1A0112	Phường Thành Công	1484
1A0111	Phường Quán Thánh	1484
1A0110	Phường Phúc Xá	1484
1A0109	Phường Nguyễn Trung Trực	1484
1A0108	Phường Ngọc Khánh	1484
1A0107	Phường Ngọc Hà	1484
1A0106	Phường Liễu Giai	1484
1A0105	Phường Kim Mã	1484
1A0104	Phường Giảng Võ	1484
1A0103	Phường Đội Cấn	1484
1A0102	Phường Điện Biên	1484
1A0101	Phường Cống Vị	1484
11013	Phường Xuân Tảo	1482
11012	Phường Xuân Đỉnh	1482
11011	Phường Thụy Phương	1482
11010	Phường Thượng Cát	1482
11009	Phường Tây Tựu	1482
11008	Phường Phúc Diễn	1482
11007	Phường Phú Diễn	1482
11006	Phường Minh Khai	1482
11005	Phường Liên Mạc	1482
11004	Phường Đức Thắng	1482
11003	Phường Đông Ngạc	1482
11002	Phường Cổ Nhuế 2	1482
11001	Phường Cổ Nhuế 1	1482
\.


--
-- TOC entry 3656 (class 0 OID 0)
-- Dependencies: 226
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_id_seq', 5, true);


--
-- TOC entry 3657 (class 0 OID 0)
-- Dependencies: 228
-- Name: branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branches_id_seq', 5, true);


--
-- TOC entry 3658 (class 0 OID 0)
-- Dependencies: 244
-- Name: cart_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_items_id_seq', 11, true);


--
-- TOC entry 3659 (class 0 OID 0)
-- Dependencies: 242
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_id_seq', 4, true);


--
-- TOC entry 3660 (class 0 OID 0)
-- Dependencies: 236
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 8, true);


--
-- TOC entry 3661 (class 0 OID 0)
-- Dependencies: 230
-- Name: colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colors_id_seq', 7, true);


--
-- TOC entry 3662 (class 0 OID 0)
-- Dependencies: 234
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 41, true);


--
-- TOC entry 3663 (class 0 OID 0)
-- Dependencies: 250
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 9, true);


--
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 248
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 8, true);


--
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 252
-- Name: payment_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_history_id_seq', 5, true);


--
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 220
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);


--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 240
-- Name: product_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_variants_id_seq', 137, true);


--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 238
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 10, true);


--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 256
-- Name: promotion_usages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promotion_usages_id_seq', 4, true);


--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 254
-- Name: promotions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promotions_id_seq', 7, true);


--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 258
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refresh_tokens_id_seq', 5, true);


--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 246
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 217
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 232
-- Name: sizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sizes_id_seq', 7, true);


--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- TOC entry 3350 (class 2606 OID 66436)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 3356 (class 2606 OID 66466)
-- Name: branches branches_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_name_key UNIQUE (name);


--
-- TOC entry 3358 (class 2606 OID 66468)
-- Name: branches branches_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_phone_key UNIQUE (phone);


--
-- TOC entry 3360 (class 2606 OID 66464)
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- TOC entry 3389 (class 2606 OID 66573)
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- TOC entry 3387 (class 2606 OID 66561)
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- TOC entry 3372 (class 2606 OID 66506)
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- TOC entry 3374 (class 2606 OID 66504)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 66477)
-- Name: colors colors_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_name_key UNIQUE (name);


--
-- TOC entry 3364 (class 2606 OID 66475)
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- TOC entry 3344 (class 2606 OID 66410)
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- TOC entry 3370 (class 2606 OID 66495)
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- TOC entry 3314 (class 2606 OID 66327)
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- TOC entry 3401 (class 2606 OID 66631)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- TOC entry 3398 (class 2606 OID 66613)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3404 (class 2606 OID 66649)
-- Name: payment_history payment_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_history
    ADD CONSTRAINT payment_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3334 (class 2606 OID 66381)
-- Name: permissions permissions_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key UNIQUE (name);


--
-- TOC entry 3336 (class 2606 OID 66379)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3385 (class 2606 OID 66530)
-- Name: product_variants product_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT product_variants_pkey PRIMARY KEY (id);


--
-- TOC entry 3377 (class 2606 OID 66517)
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


--
-- TOC entry 3379 (class 2606 OID 66515)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3411 (class 2606 OID 66671)
-- Name: promotion_usages promotion_usages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_usages
    ADD CONSTRAINT promotion_usages_pkey PRIMARY KEY (id);


--
-- TOC entry 3406 (class 2606 OID 66664)
-- Name: promotions promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT promotions_pkey PRIMARY KEY (id);


--
-- TOC entry 3342 (class 2606 OID 66405)
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- TOC entry 3413 (class 2606 OID 66698)
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3415 (class 2606 OID 66700)
-- Name: refresh_tokens refresh_tokens_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_key UNIQUE (token);


--
-- TOC entry 3395 (class 2606 OID 66594)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 3340 (class 2606 OID 66388)
-- Name: role_has_permission role_has_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permission
    ADD CONSTRAINT role_has_permission_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 3324 (class 2606 OID 66353)
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- TOC entry 3326 (class 2606 OID 66351)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3366 (class 2606 OID 66486)
-- Name: sizes sizes_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_name_key UNIQUE (name);


--
-- TOC entry 3368 (class 2606 OID 66484)
-- Name: sizes sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_pkey PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 66358)
-- Name: user_has_role user_has_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_has_role
    ADD CONSTRAINT user_has_role_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 3320 (class 2606 OID 66339)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3322 (class 2606 OID 66337)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3348 (class 2606 OID 66421)
-- Name: wards wards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wards
    ADD CONSTRAINT wards_pkey PRIMARY KEY (code);


--
-- TOC entry 3315 (class 1259 OID 66328)
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- TOC entry 3351 (class 1259 OID 66453)
-- Name: idx_address_district_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_address_district_id ON public.addresses USING btree (district_id);


--
-- TOC entry 3352 (class 1259 OID 66454)
-- Name: idx_address_province_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_address_province_id ON public.addresses USING btree (province_id);


--
-- TOC entry 3353 (class 1259 OID 66455)
-- Name: idx_address_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_address_user_id ON public.addresses USING btree (user_id);


--
-- TOC entry 3354 (class 1259 OID 66452)
-- Name: idx_address_ward_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_address_ward_code ON public.addresses USING btree (ward_code);


--
-- TOC entry 3390 (class 1259 OID 66584)
-- Name: idx_cart_item_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cart_item_cart_id ON public.cart_items USING btree (cart_id);


--
-- TOC entry 3391 (class 1259 OID 66585)
-- Name: idx_cart_item_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cart_item_variant_id ON public.cart_items USING btree (product_variant_id);


--
-- TOC entry 3346 (class 1259 OID 66427)
-- Name: idx_district_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_district_id ON public.wards USING btree (district_id);


--
-- TOC entry 3399 (class 1259 OID 66642)
-- Name: idx_order_item_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_item_order_id ON public.order_items USING btree (order_id);


--
-- TOC entry 3396 (class 1259 OID 66624)
-- Name: idx_order_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_user_id ON public.orders USING btree (user_id);


--
-- TOC entry 3402 (class 1259 OID 66655)
-- Name: idx_payment_history_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payment_history_order_id ON public.payment_history USING btree (order_id);


--
-- TOC entry 3331 (class 1259 OID 66382)
-- Name: idx_permission_api_path; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_permission_api_path ON public.permissions USING btree (api_path);


--
-- TOC entry 3332 (class 1259 OID 66383)
-- Name: idx_permission_method; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_permission_method ON public.permissions USING btree (method);


--
-- TOC entry 3375 (class 1259 OID 66523)
-- Name: idx_product_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_category_id ON public.products USING btree (category_id);


--
-- TOC entry 3407 (class 1259 OID 66689)
-- Name: idx_promotion_usages_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_promotion_usages_order_id ON public.promotion_usages USING btree (order_id);


--
-- TOC entry 3408 (class 1259 OID 66688)
-- Name: idx_promotion_usages_promotion_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_promotion_usages_promotion_id ON public.promotion_usages USING btree (promotion_id);


--
-- TOC entry 3409 (class 1259 OID 66687)
-- Name: idx_promotion_usages_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_promotion_usages_user_id ON public.promotion_usages USING btree (user_id);


--
-- TOC entry 3345 (class 1259 OID 66416)
-- Name: idx_province_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_province_id ON public.districts USING btree (province_id);


--
-- TOC entry 3392 (class 1259 OID 66606)
-- Name: idx_review_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_review_product_id ON public.reviews USING btree (product_id);


--
-- TOC entry 3393 (class 1259 OID 66605)
-- Name: idx_review_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_review_user_id ON public.reviews USING btree (user_id);


--
-- TOC entry 3337 (class 1259 OID 66400)
-- Name: idx_role_has_permission_permission_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_has_permission_permission_id ON public.role_has_permission USING btree (permission_id);


--
-- TOC entry 3338 (class 1259 OID 66399)
-- Name: idx_role_has_permission_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_has_permission_role_id ON public.role_has_permission USING btree (role_id);


--
-- TOC entry 3327 (class 1259 OID 66370)
-- Name: idx_user_has_role_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_has_role_role_id ON public.user_has_role USING btree (role_id);


--
-- TOC entry 3328 (class 1259 OID 66369)
-- Name: idx_user_has_role_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_has_role_user_id ON public.user_has_role USING btree (user_id);


--
-- TOC entry 3316 (class 1259 OID 66341)
-- Name: idx_users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_email ON public.users USING btree (email);


--
-- TOC entry 3317 (class 1259 OID 66340)
-- Name: idx_users_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_name ON public.users USING btree (name);


--
-- TOC entry 3318 (class 1259 OID 66342)
-- Name: idx_users_password; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_password ON public.users USING btree (password);


--
-- TOC entry 3380 (class 1259 OID 66552)
-- Name: idx_variant_color_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_variant_color_id ON public.product_variants USING btree (color_id);


--
-- TOC entry 3381 (class 1259 OID 66554)
-- Name: idx_variant_image_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_variant_image_id ON public.product_variants USING btree (image_id);


--
-- TOC entry 3382 (class 1259 OID 66551)
-- Name: idx_variant_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_variant_product_id ON public.product_variants USING btree (product_id);


--
-- TOC entry 3383 (class 1259 OID 66553)
-- Name: idx_variant_size_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_variant_size_id ON public.product_variants USING btree (size_id);


--
-- TOC entry 3422 (class 2606 OID 66442)
-- Name: addresses fk_address_district; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT fk_address_district FOREIGN KEY (district_id) REFERENCES public.districts(id);


--
-- TOC entry 3423 (class 2606 OID 66447)
-- Name: addresses fk_address_province; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT fk_address_province FOREIGN KEY (province_id) REFERENCES public.provinces(id);


--
-- TOC entry 3424 (class 2606 OID 66437)
-- Name: addresses fk_address_ward; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT fk_address_ward FOREIGN KEY (ward_code) REFERENCES public.wards(code);


--
-- TOC entry 3431 (class 2606 OID 66579)
-- Name: cart_items fk_cart_item_cart; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk_cart_item_cart FOREIGN KEY (cart_id) REFERENCES public.carts(id);


--
-- TOC entry 3432 (class 2606 OID 66574)
-- Name: cart_items fk_cart_item_product_variant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk_cart_item_product_variant FOREIGN KEY (product_variant_id) REFERENCES public.product_variants(id);


--
-- TOC entry 3430 (class 2606 OID 66562)
-- Name: carts fk_cart_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fk_cart_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3420 (class 2606 OID 66411)
-- Name: districts fk_district_province; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT fk_district_province FOREIGN KEY (province_id) REFERENCES public.provinces(id);


--
-- TOC entry 3435 (class 2606 OID 66619)
-- Name: orders fk_order_address; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_order_address FOREIGN KEY (address_id) REFERENCES public.addresses(id);


--
-- TOC entry 3437 (class 2606 OID 66637)
-- Name: order_items fk_order_item_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_item_order FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 3438 (class 2606 OID 66632)
-- Name: order_items fk_order_item_variant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_item_variant FOREIGN KEY (product_variant_id) REFERENCES public.product_variants(id);


--
-- TOC entry 3436 (class 2606 OID 66614)
-- Name: orders fk_order_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_order_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3439 (class 2606 OID 66650)
-- Name: payment_history fk_payment_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_history
    ADD CONSTRAINT fk_payment_order FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 3425 (class 2606 OID 66518)
-- Name: products fk_product_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 3426 (class 2606 OID 66536)
-- Name: product_variants fk_product_variant_color; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT fk_product_variant_color FOREIGN KEY (color_id) REFERENCES public.colors(id);


--
-- TOC entry 3427 (class 2606 OID 66546)
-- Name: product_variants fk_product_variant_image; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT fk_product_variant_image FOREIGN KEY (image_id) REFERENCES public.files(id);


--
-- TOC entry 3428 (class 2606 OID 66531)
-- Name: product_variants fk_product_variant_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT fk_product_variant_product FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3429 (class 2606 OID 66541)
-- Name: product_variants fk_product_variant_size; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT fk_product_variant_size FOREIGN KEY (size_id) REFERENCES public.sizes(id);


--
-- TOC entry 3440 (class 2606 OID 66682)
-- Name: promotion_usages fk_promotion_usage_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_usages
    ADD CONSTRAINT fk_promotion_usage_order FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 3441 (class 2606 OID 66677)
-- Name: promotion_usages fk_promotion_usage_promotion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_usages
    ADD CONSTRAINT fk_promotion_usage_promotion FOREIGN KEY (promotion_id) REFERENCES public.promotions(id);


--
-- TOC entry 3442 (class 2606 OID 66672)
-- Name: promotion_usages fk_promotion_usage_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_usages
    ADD CONSTRAINT fk_promotion_usage_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3433 (class 2606 OID 66600)
-- Name: reviews fk_review_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_review_product FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3434 (class 2606 OID 66595)
-- Name: reviews fk_review_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3418 (class 2606 OID 66394)
-- Name: role_has_permission fk_role_has_permission_permission; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permission
    ADD CONSTRAINT fk_role_has_permission_permission FOREIGN KEY (permission_id) REFERENCES public.permissions(id);


--
-- TOC entry 3419 (class 2606 OID 66389)
-- Name: role_has_permission fk_role_has_permission_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permission
    ADD CONSTRAINT fk_role_has_permission_role FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 3416 (class 2606 OID 66364)
-- Name: user_has_role fk_user_has_role_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_has_role
    ADD CONSTRAINT fk_user_has_role_role FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 3417 (class 2606 OID 66359)
-- Name: user_has_role fk_user_has_role_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_has_role
    ADD CONSTRAINT fk_user_has_role_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3421 (class 2606 OID 66422)
-- Name: wards fk_ward_district; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wards
    ADD CONSTRAINT fk_ward_district FOREIGN KEY (district_id) REFERENCES public.districts(id);


-- Completed on 2025-07-17 22:19:50

--
-- PostgreSQL database dump complete
--

