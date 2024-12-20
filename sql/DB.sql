PGDMP  	                     |            project    16.0    16.0 M               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16748    project    DATABASE     �   CREATE DATABASE project WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Chinese (Traditional)_Taiwan.950';
    DROP DATABASE project;
                postgres    false                        3079    16930    vector 	   EXTENSION     :   CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA public;
    DROP EXTENSION vector;
                   false                       0    0    EXTENSION vector    COMMENT     W   COMMENT ON EXTENSION vector IS 'vector data type and ivfflat and hnsw access methods';
                        false    2            �            1259    17373    comparison_result    TABLE     �   CREATE TABLE public.comparison_result (
    resultid integer NOT NULL,
    outputid1 integer,
    outputid2 integer,
    result text,
    insight text
);
 %   DROP TABLE public.comparison_result;
       public         heap    postgres    false            �            1259    17372    comparison_result_resultid_seq    SEQUENCE     �   CREATE SEQUENCE public.comparison_result_resultid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.comparison_result_resultid_seq;
       public          postgres    false    233                       0    0    comparison_result_resultid_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.comparison_result_resultid_seq OWNED BY public.comparison_result.resultid;
          public          postgres    false    232            �            1259    17286    document    TABLE     *  CREATE TABLE public.document (
    documentid integer NOT NULL,
    title character varying NOT NULL,
    publisher character varying,
    date date,
    summary text,
    author character varying,
    full_text text NOT NULL,
    analyze_state character varying,
    category character varying
);
    DROP TABLE public.document;
       public         heap    postgres    false            �            1259    17285    document_documentid_seq    SEQUENCE     �   CREATE SEQUENCE public.document_documentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.document_documentid_seq;
       public          postgres    false    223            	           0    0    document_documentid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.document_documentid_seq OWNED BY public.document.documentid;
          public          postgres    false    222            �            1259    17340 	   embedding    TABLE     �   CREATE TABLE public.embedding (
    embedid integer NOT NULL,
    summary text,
    embedding public.vector,
    metadata json
);
    DROP TABLE public.embedding;
       public         heap    postgres    false    2    2    2    2    2    2            �            1259    17339    embedding_embedid_seq    SEQUENCE     �   CREATE SEQUENCE public.embedding_embedid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.embedding_embedid_seq;
       public          postgres    false    228            
           0    0    embedding_embedid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.embedding_embedid_seq OWNED BY public.embedding.embedid;
          public          postgres    false    227            �            1259    17324    entity    TABLE     _   CREATE TABLE public.entity (
    documentid integer NOT NULL,
    entityid integer NOT NULL
);
    DROP TABLE public.entity;
       public         heap    postgres    false            �            1259    17277    entity_content    TABLE        CREATE TABLE public.entity_content (
    entityid integer NOT NULL,
    entity_name character varying,
    description text
);
 "   DROP TABLE public.entity_content;
       public         heap    postgres    false            �            1259    17276    entity_content_entityid_seq    SEQUENCE     �   CREATE SEQUENCE public.entity_content_entityid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.entity_content_entityid_seq;
       public          postgres    false    221                       0    0    entity_content_entityid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.entity_content_entityid_seq OWNED BY public.entity_content.entityid;
          public          postgres    false    220            �            1259    17349    output    TABLE     a   CREATE TABLE public.output (
    outputid integer NOT NULL,
    query text,
    response text
);
    DROP TABLE public.output;
       public         heap    postgres    false            �            1259    17357    output_chunks    TABLE        CREATE TABLE public.output_chunks (
    outputid integer NOT NULL,
    embedid integer NOT NULL,
    score double precision
);
 !   DROP TABLE public.output_chunks;
       public         heap    postgres    false            �            1259    17348    output_outputid_seq    SEQUENCE     �   CREATE SEQUENCE public.output_outputid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.output_outputid_seq;
       public          postgres    false    230                       0    0    output_outputid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.output_outputid_seq OWNED BY public.output.outputid;
          public          postgres    false    229            �            1259    17294    tag    TABLE     Y   CREATE TABLE public.tag (
    documentid integer NOT NULL,
    tagid integer NOT NULL
);
    DROP TABLE public.tag;
       public         heap    postgres    false            �            1259    17259    tag_content    TABLE     V   CREATE TABLE public.tag_content (
    tagid integer NOT NULL,
    description text
);
    DROP TABLE public.tag_content;
       public         heap    postgres    false            �            1259    17258    tag_content_tagid_seq    SEQUENCE     �   CREATE SEQUENCE public.tag_content_tagid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tag_content_tagid_seq;
       public          postgres    false    217                       0    0    tag_content_tagid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tag_content_tagid_seq OWNED BY public.tag_content.tagid;
          public          postgres    false    216            �            1259    17309    theme    TABLE     ]   CREATE TABLE public.theme (
    documentid integer NOT NULL,
    themeid integer NOT NULL
);
    DROP TABLE public.theme;
       public         heap    postgres    false            �            1259    17268    theme_content    TABLE     Z   CREATE TABLE public.theme_content (
    themeid integer NOT NULL,
    description text
);
 !   DROP TABLE public.theme_content;
       public         heap    postgres    false            �            1259    17267    theme_content_themeid_seq    SEQUENCE     �   CREATE SEQUENCE public.theme_content_themeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.theme_content_themeid_seq;
       public          postgres    false    219                       0    0    theme_content_themeid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.theme_content_themeid_seq OWNED BY public.theme_content.themeid;
          public          postgres    false    218            ?           2604    17376    comparison_result resultid    DEFAULT     �   ALTER TABLE ONLY public.comparison_result ALTER COLUMN resultid SET DEFAULT nextval('public.comparison_result_resultid_seq'::regclass);
 I   ALTER TABLE public.comparison_result ALTER COLUMN resultid DROP DEFAULT;
       public          postgres    false    232    233    233            <           2604    17289    document documentid    DEFAULT     z   ALTER TABLE ONLY public.document ALTER COLUMN documentid SET DEFAULT nextval('public.document_documentid_seq'::regclass);
 B   ALTER TABLE public.document ALTER COLUMN documentid DROP DEFAULT;
       public          postgres    false    223    222    223            =           2604    17343    embedding embedid    DEFAULT     v   ALTER TABLE ONLY public.embedding ALTER COLUMN embedid SET DEFAULT nextval('public.embedding_embedid_seq'::regclass);
 @   ALTER TABLE public.embedding ALTER COLUMN embedid DROP DEFAULT;
       public          postgres    false    228    227    228            ;           2604    17280    entity_content entityid    DEFAULT     �   ALTER TABLE ONLY public.entity_content ALTER COLUMN entityid SET DEFAULT nextval('public.entity_content_entityid_seq'::regclass);
 F   ALTER TABLE public.entity_content ALTER COLUMN entityid DROP DEFAULT;
       public          postgres    false    221    220    221            >           2604    17352    output outputid    DEFAULT     r   ALTER TABLE ONLY public.output ALTER COLUMN outputid SET DEFAULT nextval('public.output_outputid_seq'::regclass);
 >   ALTER TABLE public.output ALTER COLUMN outputid DROP DEFAULT;
       public          postgres    false    230    229    230            9           2604    17262    tag_content tagid    DEFAULT     v   ALTER TABLE ONLY public.tag_content ALTER COLUMN tagid SET DEFAULT nextval('public.tag_content_tagid_seq'::regclass);
 @   ALTER TABLE public.tag_content ALTER COLUMN tagid DROP DEFAULT;
       public          postgres    false    216    217    217            :           2604    17271    theme_content themeid    DEFAULT     ~   ALTER TABLE ONLY public.theme_content ALTER COLUMN themeid SET DEFAULT nextval('public.theme_content_themeid_seq'::regclass);
 D   ALTER TABLE public.theme_content ALTER COLUMN themeid DROP DEFAULT;
       public          postgres    false    219    218    219                       0    17373    comparison_result 
   TABLE DATA           \   COPY public.comparison_result (resultid, outputid1, outputid2, result, insight) FROM stdin;
    public          postgres    false    233   aX       �          0    17286    document 
   TABLE DATA           {   COPY public.document (documentid, title, publisher, date, summary, author, full_text, analyze_state, category) FROM stdin;
    public          postgres    false    223   ~X       �          0    17340 	   embedding 
   TABLE DATA           J   COPY public.embedding (embedid, summary, embedding, metadata) FROM stdin;
    public          postgres    false    228   �X       �          0    17324    entity 
   TABLE DATA           6   COPY public.entity (documentid, entityid) FROM stdin;
    public          postgres    false    226   �X       �          0    17277    entity_content 
   TABLE DATA           L   COPY public.entity_content (entityid, entity_name, description) FROM stdin;
    public          postgres    false    221   �X       �          0    17349    output 
   TABLE DATA           ;   COPY public.output (outputid, query, response) FROM stdin;
    public          postgres    false    230   �X       �          0    17357    output_chunks 
   TABLE DATA           A   COPY public.output_chunks (outputid, embedid, score) FROM stdin;
    public          postgres    false    231   Y       �          0    17294    tag 
   TABLE DATA           0   COPY public.tag (documentid, tagid) FROM stdin;
    public          postgres    false    224   ,Y       �          0    17259    tag_content 
   TABLE DATA           9   COPY public.tag_content (tagid, description) FROM stdin;
    public          postgres    false    217   IY       �          0    17309    theme 
   TABLE DATA           4   COPY public.theme (documentid, themeid) FROM stdin;
    public          postgres    false    225   fY       �          0    17268    theme_content 
   TABLE DATA           =   COPY public.theme_content (themeid, description) FROM stdin;
    public          postgres    false    219   �Y                  0    0    comparison_result_resultid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.comparison_result_resultid_seq', 1, false);
          public          postgres    false    232                       0    0    document_documentid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.document_documentid_seq', 1, false);
          public          postgres    false    222                       0    0    embedding_embedid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.embedding_embedid_seq', 1, false);
          public          postgres    false    227                       0    0    entity_content_entityid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.entity_content_entityid_seq', 1, false);
          public          postgres    false    220                       0    0    output_outputid_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.output_outputid_seq', 1, false);
          public          postgres    false    229                       0    0    tag_content_tagid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tag_content_tagid_seq', 1, false);
          public          postgres    false    216                       0    0    theme_content_themeid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.theme_content_themeid_seq', 1, false);
          public          postgres    false    218            U           2606    17380 (   comparison_result comparison_result_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.comparison_result
    ADD CONSTRAINT comparison_result_pkey PRIMARY KEY (resultid);
 R   ALTER TABLE ONLY public.comparison_result DROP CONSTRAINT comparison_result_pkey;
       public            postgres    false    233            G           2606    17293    document document_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.document
    ADD CONSTRAINT document_pkey PRIMARY KEY (documentid);
 @   ALTER TABLE ONLY public.document DROP CONSTRAINT document_pkey;
       public            postgres    false    223            O           2606    17347    embedding embedding_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.embedding
    ADD CONSTRAINT embedding_pkey PRIMARY KEY (embedid);
 B   ALTER TABLE ONLY public.embedding DROP CONSTRAINT embedding_pkey;
       public            postgres    false    228            E           2606    17284 "   entity_content entity_content_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.entity_content
    ADD CONSTRAINT entity_content_pkey PRIMARY KEY (entityid);
 L   ALTER TABLE ONLY public.entity_content DROP CONSTRAINT entity_content_pkey;
       public            postgres    false    221            M           2606    17328    entity entity_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.entity
    ADD CONSTRAINT entity_pkey PRIMARY KEY (documentid, entityid);
 <   ALTER TABLE ONLY public.entity DROP CONSTRAINT entity_pkey;
       public            postgres    false    226    226            S           2606    17361     output_chunks output_chunks_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.output_chunks
    ADD CONSTRAINT output_chunks_pkey PRIMARY KEY (outputid, embedid);
 J   ALTER TABLE ONLY public.output_chunks DROP CONSTRAINT output_chunks_pkey;
       public            postgres    false    231    231            Q           2606    17356    output output_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.output
    ADD CONSTRAINT output_pkey PRIMARY KEY (outputid);
 <   ALTER TABLE ONLY public.output DROP CONSTRAINT output_pkey;
       public            postgres    false    230            A           2606    17266    tag_content tag_content_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tag_content
    ADD CONSTRAINT tag_content_pkey PRIMARY KEY (tagid);
 F   ALTER TABLE ONLY public.tag_content DROP CONSTRAINT tag_content_pkey;
       public            postgres    false    217            I           2606    17298    tag tag_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (documentid, tagid);
 6   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_pkey;
       public            postgres    false    224    224            C           2606    17275     theme_content theme_content_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.theme_content
    ADD CONSTRAINT theme_content_pkey PRIMARY KEY (themeid);
 J   ALTER TABLE ONLY public.theme_content DROP CONSTRAINT theme_content_pkey;
       public            postgres    false    219            K           2606    17313    theme theme_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.theme
    ADD CONSTRAINT theme_pkey PRIMARY KEY (documentid, themeid);
 :   ALTER TABLE ONLY public.theme DROP CONSTRAINT theme_pkey;
       public            postgres    false    225    225            ^           2606    17381 2   comparison_result comparison_result_outputid1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comparison_result
    ADD CONSTRAINT comparison_result_outputid1_fkey FOREIGN KEY (outputid1) REFERENCES public.output(outputid);
 \   ALTER TABLE ONLY public.comparison_result DROP CONSTRAINT comparison_result_outputid1_fkey;
       public          postgres    false    233    4945    230            _           2606    17386 2   comparison_result comparison_result_outputid2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comparison_result
    ADD CONSTRAINT comparison_result_outputid2_fkey FOREIGN KEY (outputid2) REFERENCES public.output(outputid);
 \   ALTER TABLE ONLY public.comparison_result DROP CONSTRAINT comparison_result_outputid2_fkey;
       public          postgres    false    233    230    4945            Z           2606    17329    entity entity_documentid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entity
    ADD CONSTRAINT entity_documentid_fkey FOREIGN KEY (documentid) REFERENCES public.document(documentid);
 G   ALTER TABLE ONLY public.entity DROP CONSTRAINT entity_documentid_fkey;
       public          postgres    false    223    4935    226            [           2606    17334    entity entity_entityid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entity
    ADD CONSTRAINT entity_entityid_fkey FOREIGN KEY (entityid) REFERENCES public.entity_content(entityid);
 E   ALTER TABLE ONLY public.entity DROP CONSTRAINT entity_entityid_fkey;
       public          postgres    false    4933    226    221            \           2606    17367 (   output_chunks output_chunks_embedid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.output_chunks
    ADD CONSTRAINT output_chunks_embedid_fkey FOREIGN KEY (embedid) REFERENCES public.embedding(embedid);
 R   ALTER TABLE ONLY public.output_chunks DROP CONSTRAINT output_chunks_embedid_fkey;
       public          postgres    false    231    228    4943            ]           2606    17362 )   output_chunks output_chunks_outputid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.output_chunks
    ADD CONSTRAINT output_chunks_outputid_fkey FOREIGN KEY (outputid) REFERENCES public.output(outputid);
 S   ALTER TABLE ONLY public.output_chunks DROP CONSTRAINT output_chunks_outputid_fkey;
       public          postgres    false    230    231    4945            V           2606    17299    tag tag_documentid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_documentid_fkey FOREIGN KEY (documentid) REFERENCES public.document(documentid);
 A   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_documentid_fkey;
       public          postgres    false    4935    224    223            W           2606    17304    tag tag_tagid_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_tagid_fkey FOREIGN KEY (tagid) REFERENCES public.tag_content(tagid);
 <   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_tagid_fkey;
       public          postgres    false    217    4929    224            X           2606    17314    theme theme_documentid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.theme
    ADD CONSTRAINT theme_documentid_fkey FOREIGN KEY (documentid) REFERENCES public.document(documentid);
 E   ALTER TABLE ONLY public.theme DROP CONSTRAINT theme_documentid_fkey;
       public          postgres    false    223    225    4935            Y           2606    17319    theme theme_themeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.theme
    ADD CONSTRAINT theme_themeid_fkey FOREIGN KEY (themeid) REFERENCES public.theme_content(themeid);
 B   ALTER TABLE ONLY public.theme DROP CONSTRAINT theme_themeid_fkey;
       public          postgres    false    219    225    4931                   x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     