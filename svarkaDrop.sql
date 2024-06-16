PGDMP                         |            svarka    13.10    14.8 (    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
       public         heap    postgres    false            �            1259    17255    reclame    TABLE     �   CREATE TABLE public.reclame (
    id integer NOT NULL,
    article_id integer,
    text character varying(255) DEFAULT NULL::character varying,
    link character varying(255) NOT NULL,
    block integer
);
    DROP TABLE public.reclame;
       public         heap    postgres    false            �            1259    17253    reclame_id_seq    SEQUENCE     w   CREATE SEQUENCE public.reclame_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reclame_id_seq;
       public          postgres    false            �            1259    17058    users    TABLE     �   CREATE TABLE public.users (
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
    public          postgres    false    207   i,       �          0    17095    blocks 
   TABLE DATA           F   COPY public.blocks (id, article_id, type, content, title) FROM stdin;
    public          postgres    false    208   ,0       �          0    17068 
   categories 
   TABLE DATA           5   COPY public.categories (id, name, image) FROM stdin;
    public          postgres    false    204   D       �          0    17050    doctrine_migration_versions 
   TABLE DATA           [   COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
    public          postgres    false    200   �E       �          0    17255    reclame 
   TABLE DATA           D   COPY public.reclame (id, article_id, text, link, block) FROM stdin;
    public          postgres    false    210   tF       �          0    17058    users 
   TABLE DATA           :   COPY public.users (id, name, email, password) FROM stdin;
    public          postgres    false    202   CG       �           0    0    articles_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.articles_id_seq', 37, true);
          public          postgres    false    205            �           0    0    blocks_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.blocks_id_seq', 49, true);
          public          postgres    false    206            �           0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 10, true);
          public          postgres    false    203            �           0    0    reclame_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.reclame_id_seq', 3, true);
          public          postgres    false    209            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 3, true);
          public          postgres    false    201                       2606    17092    articles articles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.articles DROP CONSTRAINT articles_pkey;
       public            postgres    false    207                       2606    17102    blocks blocks_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.blocks
    ADD CONSTRAINT blocks_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.blocks DROP CONSTRAINT blocks_pkey;
       public            postgres    false    208                       2606    17075    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    204            �           2606    17055 <   doctrine_migration_versions doctrine_migration_versions_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);
 f   ALTER TABLE ONLY public.doctrine_migration_versions DROP CONSTRAINT doctrine_migration_versions_pkey;
       public            postgres    false    200            
           2606    17263    reclame reclame_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reclame
    ADD CONSTRAINT reclame_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reclame DROP CONSTRAINT reclame_pkey;
       public            postgres    false    210            �           2606    17065    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    202                       1259    17093    idx_bfdd316812469de2    INDEX     P   CREATE INDEX idx_bfdd316812469de2 ON public.articles USING btree (category_id);
 (   DROP INDEX public.idx_bfdd316812469de2;
       public            postgres    false    207                       1259    17094    idx_bfdd316861220ea6    INDEX     O   CREATE INDEX idx_bfdd316861220ea6 ON public.articles USING btree (creator_id);
 (   DROP INDEX public.idx_bfdd316861220ea6;
       public            postgres    false    207                       1259    17103    idx_ceed95787294869c    INDEX     M   CREATE INDEX idx_ceed95787294869c ON public.blocks USING btree (article_id);
 (   DROP INDEX public.idx_ceed95787294869c;
       public            postgres    false    208                       1259    17264    uniq_b55ee4997294869c    INDEX     V   CREATE UNIQUE INDEX uniq_b55ee4997294869c ON public.reclame USING btree (article_id);
 )   DROP INDEX public.uniq_b55ee4997294869c;
       public            postgres    false    210                       2606    17265    reclame fk_b55ee4997294869c    FK CONSTRAINT     �   ALTER TABLE ONLY public.reclame
    ADD CONSTRAINT fk_b55ee4997294869c FOREIGN KEY (article_id) REFERENCES public.articles(id);
 E   ALTER TABLE ONLY public.reclame DROP CONSTRAINT fk_b55ee4997294869c;
       public          postgres    false    210    207    3075                       2606    17104    articles fk_bfdd316812469de2    FK CONSTRAINT     �   ALTER TABLE ONLY public.articles
    ADD CONSTRAINT fk_bfdd316812469de2 FOREIGN KEY (category_id) REFERENCES public.categories(id);
 F   ALTER TABLE ONLY public.articles DROP CONSTRAINT fk_bfdd316812469de2;
       public          postgres    false    204    207    3073                       2606    17109    articles fk_bfdd316861220ea6    FK CONSTRAINT     ~   ALTER TABLE ONLY public.articles
    ADD CONSTRAINT fk_bfdd316861220ea6 FOREIGN KEY (creator_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.articles DROP CONSTRAINT fk_bfdd316861220ea6;
       public          postgres    false    207    3071    202                       2606    17114    blocks fk_ceed95787294869c    FK CONSTRAINT        ALTER TABLE ONLY public.blocks
    ADD CONSTRAINT fk_ceed95787294869c FOREIGN KEY (article_id) REFERENCES public.articles(id);
 D   ALTER TABLE ONLY public.blocks DROP CONSTRAINT fk_ceed95787294869c;
       public          postgres    false    3075    207    208            �   �  x��V[N�P�vV�`p�7�@W�T9(Phx(�Z�WHiڨ�*UU����1ILLFb�n�����k���N��(���cΜ93���'�Ȇ�Ly"�"4ŭ<W��y�)OM݉����F�x��ڔub(|ñ��eg,;g���j�V]��q7KՕ����қg���z�lrg��v�x�W^��/m&�
�O��ǁ����:�^�P�a���;��{&.]���z@�B1tOt�����Ĭl��O� ��ѓD���Q���UO{�Xv>ƣ���[��(��j�u�WN�X�&#Rȁ�CSc��'F��ÅΔc�&�'�E����M�	���>��A�DO4�����P����x��M�1�>b|�/����+k}o�P�-�ׅ��F��b�J"0D	1��%�舘�W[E�10A<h&m%�йt&��2'}��c��32�B1H�xb0RB��.��D ̇���P�0�y����!�)(b�X3�"���ҶUu�d�Ii�iE�9� �����r��`<d�o'؝���a{H\��mw�*bi�x<|̆���eC���-�!�_��Q���5"e��C:��E.9� �Kp�ױ��¶�F��{mw�:�:Ҳm��wUQ&M\��:�GTq|@$�*�B.M�X�ր�n��s�s�M��n[I��=�ٶf�QYw_�M�\P�Z�Z�h���LV�1�u]Ừ��>pm����ɖJYU���aG�����g	�dR�]��,�ٝ4Te�z��Ώ.�ѥ������'?2�!��~��ߐҹ8C�}��+=ݏ�ǚ�X3F>J��5� ��4 em��G�t��YϖTV�$Ky����������^K�>�u�y�9k�T��9�/�Sf�O�d�o�C8Q�;��F�?���!;d{�D9]u�ߍK5��D	��% �g,���L4�@9
��r"����|      �      x��[�nW�]�"��@�I=����@��gD�ՖHC�x�^�ES��L�����C�,z1h Y�$��UI@_�����8'�ޛYE��kA�IfU޼7�'ND��V{��_���u%�N��u���Y]6��>���ٯ/�3�X�B=�k�A3�ˬ٫�����As�ɧy}.��㬾�́\ʗ�zZ�z��,�N�%�e(����R�[4����A.p}���u�]Hn��_�.d=YGV,d�����Us��j��J�g�'맙���<Mo*�6=ɗ��=�Bi��q����!���\}\w��W8ƞiԼ���eݗ��K�K�<�8�\f́�8�h.�#>O�#�:�?3�e�ɥ�޽�/�����v��sۮe��W9�rLnO������멨K"�w�fYg���~�m���\5���,����^����tQ�es(
�Ǌ��z�:���v}�sB�������,
7�<�?Ϛ�d���ȍ{��HV<mVzK�7E�o|���hcggsw�#���у�'����~����ɟ;�|��/�=�����'��X��g���꿩���A�A���[~�Δ3��
!���7�u�z�z��z��zÔK�Wa��Ayb|r�u)8ds$��-�=Q�؟?u�<S5�ר��ܙ��H>E���Ku`W���7�(K��p��|��X}@E�򾭧�����?�t��'ۛ�a�X]\^v9�=~��ri�nOtoq��x���aU�AA�iD#�)��wּ�_.���XG�(���$��H�	XP�ؔF.��@��)'��"����rU��G�[\a�X
:
AR�������&~�pa�)5b��s�6�>�7�K�5"�h�Gn�!r� ��<�+�?]�,^_��uoKғ� :��;Ѥ�[����,_�E�*_n5�#|P�j��+�c���M졲����#�����#}�n�¦�za�<���i;��*��Ԕ9֤���bBxf~(@��1=Ϛc]���e��.��,�/T�9��7[�1OU8T����C�J�W�ki���U��/˖O$��f؞�4�SP���P8���BƏ^��S.�l���J�	8��j��x'�K/#-���j/��C��f+���P�� �넶ۻ۫˫��o��v�c�n_�Q�Kk��j�ۙOs�^7\Y��r�K\�)#U��\����+�6w�e$~�&o����#�$�X�;���.�P��)�T&L� ؕ�4Y��>�h����r�ؒX��>��B�*����=5�����^���Ma�9��l�<�dm��� Nn����;�y�Z$<��
�U���uf04W(z�#<���	��A&eGTha
���Cp���>S����a7�N�u9�~�?��1�����D�Dneм��^n�!h��x����1��R��Z����hX�+L�d&�@�zǐw�à�JT�L�6ٓ�}M����FO���Ĝ���wע3$�
{d	r<'���Ɋq7o�}.P�0��l����4��Z.�����u��,8
�T�+��rj����Қ��;5��qG3y�3���~%��2��<��S� ~��(�fDu�R��|�eЮ ���K�Ek�)�PE���T�F.5�D�5u�dn���"�R��\R3*:Z�7ma@FE���4?��J�݁�� �,j�7���&8]�c��D���	5l!��;.t�rn		�2��^���!���Tʔ�$�B}!�:��Y^<(��|�^��ge�|����ۉV�G�J(:J;�	��~�Ϫ5a�~Z��,=/�dyؤ��Q�"�(�9��W��Y���刲��qB��	��#-�V+xn��C�!0�s$vZ�<��:�16����݊̔-��'�8�Z�)��Ԭ��	�oƢ:G(���@��s��"U�gW^ʉ#C�b�39�2΍��Ϧ���������!�S`\T����M� �̪Ci�YZ��'1XXmN�g�u9��,
�� �,H�R�8��X��e�0�,�"�;-�I�7�w�g����&����Uŷ���&�*ɭ�����~Z��4}���q��Oo<������������*Q���������?��Om�����7�X�q�*���%�#W��<�������Kkǌ���}��/c���UM�B��d�L���b������tw"��6CʆIj�%�Et���#\�9B��O?`��c���NV�3$�#]�aCl)���tQ�is��|3�d��g���7�0%�Ҽ�m���!�ÍQ�Z��|�{ɯ�·�C�Xy�\��1/������f��Zc���������U��Z��
��ub�R��P��!�p�1i$�J��g�Ŗ2��8������V��X'��Afdz�}ĉ$:15�����u޼�`d�N�Ic�E(�;x���6�LC��h]_�اbݽ��[���C�<���L��LC����~����u��:|`>�X����$$�Ѹy���fq���1e��C�UOu��XM\fئ�~���q�l��"���庤־�ZA�3�cX��㍼H��@9liZ��+Z�z[=C;����}Pk��7𩇔v����ַ�2���!��ʖ: �>�lbv�̽����ε �l���w0\d�?A��*�@�*g�(C��'q���J=B�S�j�u�6+`��k��A�{q�f��%���	����t�;��h�G�'�wxW��cw�2@�$�Ť5�no}-�]�A�b舃�g%�`�\����L�k��H�����"�1@��ZVN�%4��=򕁕��J27(�+a��,�#�Q�����GLrg�̭R�;ɢ����gkV��`CxtbO��)80U��dL�l	�'���M-�aV���&��(���N�J}��%�f��Hv��<v|��qd���pf�{� �'�u��5R+q:G�-�k�kA����ŧV;�"�ZKЧ`�OLN��WN�\�v��yT2&�¨�fWX�q3.$Օ��BY:4�H.͡�t��]��e-��T�\2�k#$^M�}�o����f:��(6�@�^�DTw��CP�X���TΉ��#���&x�:�,�!�"�Ƴ	�)+���e)�s��+����uU����{��nA}���wP���Q�T�!���Į��oz�'�$�ts�������1�h��1�!��Oϓ܆�OQ��Ad����^YV��X�h�/�=�
�w�Mq
��T�~%��OZs�s��Ĩ3�μP�t	Ĭ�F�����FJfmF�6�G��z�3eS0ۆ��m.c�	��)>��%Tu���S�Ӓ�{p�Ag�QkUc�c�%�cm�3�b�RG�3��<}w�����9��릝�S�FG�,N��n��sPԥ��%"H�#�&r�����.p���I����<�HF5�S�q7d'�3��U����2�4��i��]#�����>��O�3l�ǉ)�p@p��k�a#I6��*�� ������w�nf�a4C�oǵZCj�E���*�e,'l�&�F�Q#̛���ٰ�Ъě��Z�[,�6�c\OlU8��L�����#y��T^���ă����~ �fA��#���d�J�G��7b�x��\�
0��v��{S�`�`�q*���~X7����CUW��j�C&��8\"P�G|fܤ㶙uLs�;@��|����ݴ�8NG+@C6	)��a�3��Õ�0g>�D�ܛV<׉q�S5�X���a �]h�髵��ųm��p:`�O1,c
��j�7�$���b�Em3om��e��~3������{��o��㜎꿧E:��_0�
s���OӒ�`%��N�U8bci0<��'��~lEuq��y�d����m��䄃�fٴS���+q>�W�]��:��7!��}UKK���?� �g�ܼ���&��S��k�0�t|�Z��!dg22u��
�E���i`���.����l��!7�����uk�dj#�&�=�ňi�k�/�ݩp�+v�]a��R�g1�fİ%ߎ�b&��ފY��V�Vj!b �  �ƈ�<Vܴ�mR��)I�`�"��[O7�o�n>y����G��6?�}�}��\{����O��vnmn���a��#q�uu��.wQ�7g�r���٥�7{뷌����Ck����{\]��s$�a�����:�� ��I�uDT����8��sUO0:c�ZsDNhA��L�ЋY����M��W��{�vo��cH'�Mː�=���Z%^��������!����On���(�0�M��_�,r��jV[���F? ���}�����J�I��M�����5wޚ�o8��aq�{�"XO��7�q�X(p���f�L��YW|�&i�'��3]���Ѐ��'P|�S-j}�d^��Q�.�T�H�pf�n^Ƴ �P#��Pb��e'��[tX�/A�**8��v��닃�;
�z��Q���W��fbI�[.�m��Bq��C9�k��W�&�����;&-�WqLPc#~a��rI(���b2E�Z �!N� �m�e5 }�n��	u�,%|I0�c��ޭp#������{�s�$�[������|�u��v��~�Z�����;zS!)���+���sX���b�ʆW�dl��ˋ�����qf/,�n;rt�8 �̪ժy�Wh'��}�:(�-��/��G�k�L�!�Y�k�+"�;� �E:W��c�zR�N=1T���ܘ��c�-�d�A��(����͹�ɀ� �y��8���
/1(ͩ�2����@����b�#9��r���>ǹ"���Sirk$���{�>̜�{}�[���j�t~�����m*!Z�U�Y��":�p�s؝��n�2Q��z��)�5I�`1��Eƴ��[�Co}��N��_x�Uo�J'���&Mi��W��dN��p��j#�@fo���R{�<��1�tL��<�@؀5�9{h=�AY��
�ȃ�O�`D�=�|�-C��&��a
՟X�]��k�u/A���9W(,�[YZZ�?ތ�Y      �   �  x����N�@���S����.n�v,GJ�tJ�(]�H�ʕ�ąK���μ�[b\�M;3���w��c��8���8;0	����%N�X�xÙ�Z�H��/<�ێ���B�2&�H�Vұ{ԺH�>����8�5o93�P�&1c32ޘ{to�ӝ+}�S��¡5����f�k(�!����7�H�RJG{�3�_x��R(�f*�uFuT8tU,��A����L�ƭ���׌:]	N����g_X����L�b�x���z��[3k��Bw�jg!	�*�K���VTkp����
���JJO�t��$~�W�����b�&�.{W�A����E��j�*�'*٣C�?x��6D�B.�#6�&�n�G��K��y�-۶ �3x      �   �   x���;
�0@g��@�~�i�ڵS�RBɒ@��SJZJ!��{��~�=�i��}�>�eކ�2��e$�DX�ݫ�;��U9*W�|��#�����#��Ia���r�_p Ŷ��?�����!o4����-r@k�U�a9$�d�@2G Rq�����	v���Q�������Ïm      �   �   x���K�1��q��$\D����YeknHn�LE܏���-����@q����[ab�+J"���/���t���?��6�H۴떯:m�����zBр��Tl �tm�<�jh���\3���#T�-�&eO?��,v�_�+7G�c�p�̼�z�(��s9�u\�����+Q�e!�p+GZJ��|�      �   Y   x�3�0��v\�}a7gIjq�Cnbf�^Q)gayjQI���1�1�6]�pa�	6�o���¾�8��s�˰����� �+�     