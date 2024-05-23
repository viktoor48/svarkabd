PGDMP     	                    |            svarka    13.10    14.8 !    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17049    svarka    DATABASE     Q   CREATE DATABASE svarka WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE svarka;
                postgres    false            �            1259    17084    articles    TABLE     *  CREATE TABLE public.articles (
    id integer NOT NULL,
    category_id integer NOT NULL,
    creator_id integer NOT NULL,
    name character varying(255) NOT NULL,
    date character varying(255) DEFAULT NULL::character varying,
    image character varying(255) DEFAULT NULL::character varying
);
    DROP TABLE public.articles;
       public         heap    postgres    false            �            1259    17080    articles_id_seq    SEQUENCE     x   CREATE SEQUENCE public.articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.articles_id_seq;
       public          postgres    false            �            1259    17095    blocks    TABLE     �   CREATE TABLE public.blocks (
    id integer NOT NULL,
    article_id integer NOT NULL,
    type character varying(255) NOT NULL,
    content text NOT NULL,
    title character varying(255) DEFAULT NULL::character varying
);
    DROP TABLE public.blocks;
       public         heap    postgres    false            �            1259    17082    blocks_id_seq    SEQUENCE     v   CREATE SEQUENCE public.blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.blocks_id_seq;
       public          postgres    false            �            1259    17068 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(255) NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    17066    categories_id_seq    SEQUENCE     z   CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false            �            1259    17050    doctrine_migration_versions    TABLE     �   CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);
 /   DROP TABLE public.doctrine_migration_versions;
       public         heap    postgres    false            �            1259    17058    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    17056    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false            �          0    17084    articles 
   TABLE DATA           R   COPY public.articles (id, category_id, creator_id, name, date, image) FROM stdin;
    public          postgres    false    207   |$       �          0    17095    blocks 
   TABLE DATA           F   COPY public.blocks (id, article_id, type, content, title) FROM stdin;
    public          postgres    false    208   �&       �          0    17068 
   categories 
   TABLE DATA           5   COPY public.categories (id, name, image) FROM stdin;
    public          postgres    false    204   �0       �          0    17050    doctrine_migration_versions 
   TABLE DATA           [   COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
    public          postgres    false    200   2       �          0    17058    users 
   TABLE DATA           :   COPY public.users (id, name, email, password) FROM stdin;
    public          postgres    false    202   �2       �           0    0    articles_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.articles_id_seq', 17, true);
          public          postgres    false    205            �           0    0    blocks_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.blocks_id_seq', 28, true);
          public          postgres    false    206            �           0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 10, true);
          public          postgres    false    203            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          postgres    false    201            �           2606    17092    articles articles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.articles DROP CONSTRAINT articles_pkey;
       public            postgres    false    207            �           2606    17102    blocks blocks_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.blocks
    ADD CONSTRAINT blocks_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.blocks DROP CONSTRAINT blocks_pkey;
       public            postgres    false    208            �           2606    17075    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    204            �           2606    17055 <   doctrine_migration_versions doctrine_migration_versions_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);
 f   ALTER TABLE ONLY public.doctrine_migration_versions DROP CONSTRAINT doctrine_migration_versions_pkey;
       public            postgres    false    200            �           2606    17065    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    202            �           1259    17093    idx_bfdd316812469de2    INDEX     P   CREATE INDEX idx_bfdd316812469de2 ON public.articles USING btree (category_id);
 (   DROP INDEX public.idx_bfdd316812469de2;
       public            postgres    false    207            �           1259    17094    idx_bfdd316861220ea6    INDEX     O   CREATE INDEX idx_bfdd316861220ea6 ON public.articles USING btree (creator_id);
 (   DROP INDEX public.idx_bfdd316861220ea6;
       public            postgres    false    207                        1259    17103    idx_ceed95787294869c    INDEX     M   CREATE INDEX idx_ceed95787294869c ON public.blocks USING btree (article_id);
 (   DROP INDEX public.idx_ceed95787294869c;
       public            postgres    false    208                       2606    17104    articles fk_bfdd316812469de2    FK CONSTRAINT     �   ALTER TABLE ONLY public.articles
    ADD CONSTRAINT fk_bfdd316812469de2 FOREIGN KEY (category_id) REFERENCES public.categories(id);
 F   ALTER TABLE ONLY public.articles DROP CONSTRAINT fk_bfdd316812469de2;
       public          postgres    false    207    3065    204                       2606    17109    articles fk_bfdd316861220ea6    FK CONSTRAINT     ~   ALTER TABLE ONLY public.articles
    ADD CONSTRAINT fk_bfdd316861220ea6 FOREIGN KEY (creator_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.articles DROP CONSTRAINT fk_bfdd316861220ea6;
       public          postgres    false    202    207    3063                       2606    17114    blocks fk_ceed95787294869c    FK CONSTRAINT        ALTER TABLE ONLY public.blocks
    ADD CONSTRAINT fk_ceed95787294869c FOREIGN KEY (article_id) REFERENCES public.articles(id);
 D   ALTER TABLE ONLY public.blocks DROP CONSTRAINT fk_ceed95787294869c;
       public          postgres    false    208    207    3067            �   d  x���[n�@���*f1cn}���J��
��0jI��(M+�F�cզ�\��k����-d%����J����x.�;��i����j&�#�.�\�B��B��7xj�.Ew2��me��X 	5E���۲Ӫ�V�(����R��=�t2=��<�;�=��r����ۚz���kʖQ!�/8>r��ȕ"�NF��+�Le���4�|�U1�;5ú)�c�NF�E;R�2z;V�h9E���l�#�k��fmR����ђ] �B�D]b)C�ԩ��׈��
r��T���YWG�7��{C_�	�TlBu�1J�����)�����k��8�$����D�S�f���!�g28D�ƀ/ <���͌3�=�z$��4����5Κ�i�Y��������So�����u���U�9Y�-���=�E�2�F@�D]�D0.4��ЇKH���[�>R�t�?��芝6�t��s���56sj�\|��<�2����q+$O�62���-���������#��J�Cs��~>]w����Τ����nT	��V���'�"Wd����W��n�����~��k��Z�m�Q��y]�wͲcW4��b�P���D      �   �	  x��X�n�}&�b>��E�����@��@����ĶIq�<IddY�-�R;}�S�ɑ��p�f�({�������-���̜}�e��/ۭn�h��Q�xS�����H:Q1+��H�a�G�I1�W7�0�b`��~�+Ҩ<.����^y�۸�����8*��ϴ��Á}�Y�$��	?�?���~��7){�Q��H��1�M!Ȏ���+���������}2-_����MJ
[p3�F���݆C��%?����A�W�<`����E�vud8����f��F�K{wkr�M�y�*x��.���Y����\3�F���1�����95�G���_��w[�{��A^}��)Y0~�f�ԃ��e�x[d.���7v���ʋb܉����2���*�R�_ljQ:-O- v��/�1bT��Aԭ9!	f��On
�I YU����W&+)&v�V~��a��l��2�=�y�ۺ�sx�{tx���|����߿88���C�y���G;~�p�G��?�l~�d�A�� ~��N�!�ʱB�Q���<8�"���P:��/N�,�-���'��WЇ� �
���lJ�����9�X�����/�:)�#�D��Y.��K�s�h�H���oxh��i4'�OB#�z��SX�1�����7���~{��&�)�R޴�Ͻ����F����,��s�7�q�G�
$td�d$���Y0��_(�QyeL��+��a�)��=G��
N�=��J��C+'��ʅ��=�$��~[���uT�䠊$�;�3����5�t�I�XHq	N�� �#;q&�^�"&Rg.
'C�D Qg͸���Z7������?��X̌�Ψ�5�NP�,��+��^)-��T�;�Ep��ZQ^�cF����鱊J�s=}�L�
��S��Y/0l&3��߳�8��cx�4�<�c��ŝ����`�ˬ.ϳ��D��W�k���}m�<yFA�4�9�s�����0 �B���,T`����M�l*_�&��;�C�B}��P�<T���Y��,�DjS�f�e��T
�m4'�N�±Do�,]������jr���ıb���Fn�[���!��{�������{�6�nm=�޺��̆B��d�]��>憯�����O�~������K��&�"io��n�P͎��vJ���C�|+�V�V()g���A\�H�qԛ*���$ �3�����]-])�X���!E"HlE&���PS2� ib�p_R��8�c'Z�d(���=U��ԭ�C�;���=x��G4?�NT�%�m1�7���k6l�H͆��!�h5�0���'|ӕ��C�y�������4��?�Dn�U��|��ө����*����[7*G}�+t�˴=Q��X�揁We������fu�k}P�4���	(��LJP��%,�PN]�����&k`�> �T�j��@'n	(늍B�@o��ѱW�����7��+h�:NK��2�#��:j̹\�ڢv�-���H�)�"���7(`�f����WsD���bGU(�?c	�N�1������oKq3���D`�}9+l�Y�X�L�47�(C����Z`^��"X����!����&�z.��#�D ���A�02GA�;�,�O;�|ng�z���(d�\����,:�>J�����;	�;W2��&�$�J��{��CZW1�s���p�f���[�>��R�]֜#72�ިj�!���(��sOP��n帚a���z��Xu�AĜ�e�<g���l�߿�`j��W�a�ԑ�!�̹�����kOoS}��`/w@���d��F���@y΁GE
�YBt�ˣ��D��ސ���a�C���P[�����{�V���@��c߃( nP�Pv&�y�N<q"�<�3dZ=�=��ĜTd��j����~[4g��c��S�ɯᐰ-Z�q��3��8��E�W�ۆ�9������/ �|2�.�����\�d���H�j%`�_�P&d ��>��ۀz���]ca�,\�o!��T�{���s��lqca��eaS���[a.��I�cn��nBB)OS�Z9��=���i��9x��p���Ý�����FW]|{����+�-`��D���7�N��c���l6СW�Q����jAY�-C��nһU	%D�|Z4`pn���=�;#u��R�>{?��jJ��]�J��f_/���LX� ��{P!��T��=�2���|�iyR^A��CY��۷H>[,QP�ֹP;�:�$�#�y�dkvo�Cm�L�+e���NV	\[g^�5�#R;���Š��3�w���ͼ�6�V��B=b�`JÊ>l��xT)�V�&��p�6��j��ޣ�y?�z��Y���P��)�5Il�դI�����A��1�љ0c�U�W/tJV�M�g��tJ����V��f������      �   �  x����N�@���S����.n�v,GJ�tJ�(]�H�ʕ�ąK���μ�[b\�M;3���w��c��8���8;0	����%N�X�xÙ�Z�H��/<�ێ���B�2&�H�Vұ{ԺH�>����8�5o93�P�&1c32ޘ{to�ӝ+}�S��¡5����f�k(�!����7�H�RJG{�3�_x��R(�f*�uFuT8tU,��A����L�ƭ���׌:]	N����g_X����L�b�x���z��[3k��Bw�jg!	�*�K���VTkp����
���JJO�t��$~�W�����b�&�.{W�A����E��j�*�'*٣C�?x��6D�B.�#6�&�n�G��K��y�-۶ �3x      �   �   x���1
�0��>�/�"�[q�9k�N^J	%KI�OU(��Bl���5��c���<߷�1��^�e�v;	I$�p&���:���@����♬���m����B�@I?@ 
�} RR@�>JEa��כ��п�U
l���x��� ��k�      �   4   x�3�0��v\�}a7gIjq�Cnbf�^Q)gayjQI���1W� �"�     