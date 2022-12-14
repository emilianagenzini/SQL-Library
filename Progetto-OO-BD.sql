PGDMP     	                    z            Progetto-OO-BD    14.2    14.2 3    8           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            9           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            :           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ;           1262    16394    Progetto-OO-BD    DATABASE     l   CREATE DATABASE "Progetto-OO-BD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Italian_Italy.1252';
     DROP DATABASE "Progetto-OO-BD";
                postgres    false            ?            1255    16658    currentdate()    FUNCTION     ?   CREATE FUNCTION public.currentdate() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN 
 new.data_accesso := CURRENT_TIMESTAMP; 
 RETURN NEW;
END;$$;
 $   DROP FUNCTION public.currentdate();
       public          postgres    false            ?            1259    16747 
   Appartiene    TABLE     s   CREATE TABLE public."Appartiene" (
    "titolo-riferimento" text NOT NULL,
    "titolo-categoria" text NOT NULL
);
     DROP TABLE public."Appartiene";
       public         heap    postgres    false            ?            1259    16735 	   Categoria    TABLE     b   CREATE TABLE public."Categoria" (
    "Utente" text NOT NULL,
    nome_categoria text NOT NULL
);
    DROP TABLE public."Categoria";
       public         heap    postgres    false            ?            1259    16521 	   Citazione    TABLE     V   CREATE TABLE public."Citazione" (
    "Titolo-Cita" text,
    "Titolo_Citato" text
);
    DROP TABLE public."Citazione";
       public         heap    postgres    false            ?            1259    16507 
   Intervista    TABLE     _   CREATE TABLE public."Intervista" (
    num_pag integer NOT NULL,
    "Titolo" text NOT NULL
);
     DROP TABLE public."Intervista";
       public         heap    postgres    false            ?            1259    16545    Scrive    TABLE     N   CREATE TABLE public."Scrive" (
    "Titolo" text NOT NULL,
    "Nome" text
);
    DROP TABLE public."Scrive";
       public         heap    postgres    false            ?            1259    16622    accessi    TABLE     s   CREATE TABLE public.accessi (
    username text NOT NULL,
    data_accesso timestamp without time zone NOT NULL
);
    DROP TABLE public.accessi;
       public         heap    postgres    false            ?            1259    16671    articoli_scientifici    TABLE     }   CREATE TABLE public.articoli_scientifici (
    num_pag integer NOT NULL,
    titolo text NOT NULL,
    tipo text NOT NULL
);
 (   DROP TABLE public.articoli_scientifici;
       public         heap    postgres    false            ?            1259    16493    libro    TABLE     V   CREATE TABLE public.libro (
    num_pag integer NOT NULL,
    titolo text NOT NULL
);
    DROP TABLE public.libro;
       public         heap    postgres    false            ?            1259    16444    riferimenti_bibliografici     TABLE     ?   CREATE TABLE public."riferimenti_bibliografici " (
    "Titolo" text NOT NULL,
    "Descrizione" text DEFAULT 'Nessuna descrizione'::text,
    "Utente" text NOT NULL,
    data_inserimento text NOT NULL,
    data_pubblicazione text NOT NULL
);
 0   DROP TABLE public."riferimenti_bibliografici ";
       public         heap    postgres    false            ?            1259    16395    utente    TABLE     t   CREATE TABLE public.utente (
    username text NOT NULL,
    password text NOT NULL,
    password2 text NOT NULL
);
    DROP TABLE public.utente;
       public         heap    postgres    false            5          0    16747 
   Appartiene 
   TABLE DATA           P   COPY public."Appartiene" ("titolo-riferimento", "titolo-categoria") FROM stdin;
    public          postgres    false    218   1;       4          0    16735 	   Categoria 
   TABLE DATA           ?   COPY public."Categoria" ("Utente", nome_categoria) FROM stdin;
    public          postgres    false    217   N;       0          0    16521 	   Citazione 
   TABLE DATA           E   COPY public."Citazione" ("Titolo-Cita", "Titolo_Citato") FROM stdin;
    public          postgres    false    213   ?;       /          0    16507 
   Intervista 
   TABLE DATA           9   COPY public."Intervista" (num_pag, "Titolo") FROM stdin;
    public          postgres    false    212   ?;       1          0    16545    Scrive 
   TABLE DATA           4   COPY public."Scrive" ("Titolo", "Nome") FROM stdin;
    public          postgres    false    214   ?;       2          0    16622    accessi 
   TABLE DATA           9   COPY public.accessi (username, data_accesso) FROM stdin;
    public          postgres    false    215   ?<       3          0    16671    articoli_scientifici 
   TABLE DATA           E   COPY public.articoli_scientifici (num_pag, titolo, tipo) FROM stdin;
    public          postgres    false    216   1F       .          0    16493    libro 
   TABLE DATA           0   COPY public.libro (num_pag, titolo) FROM stdin;
    public          postgres    false    211   qF       -          0    16444    riferimenti_bibliografici  
   TABLE DATA              COPY public."riferimenti_bibliografici " ("Titolo", "Descrizione", "Utente", data_inserimento, data_pubblicazione) FROM stdin;
    public          postgres    false    210   8G       ,          0    16395    utente 
   TABLE DATA           ?   COPY public.utente (username, password, password2) FROM stdin;
    public          postgres    false    209   ?H       ?           2606    16753    Categoria Categoria_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Categoria"
    ADD CONSTRAINT "Categoria_pkey" PRIMARY KEY (nome_categoria);
 F   ALTER TABLE ONLY public."Categoria" DROP CONSTRAINT "Categoria_pkey";
       public            postgres    false    217            ?           2606    16661    Intervista Intervista_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Intervista"
    ADD CONSTRAINT "Intervista_pkey" PRIMARY KEY ("Titolo");
 H   ALTER TABLE ONLY public."Intervista" DROP CONSTRAINT "Intervista_pkey";
       public            postgres    false    212            ?           2606    16584    libro Libri_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.libro
    ADD CONSTRAINT "Libri_pkey" PRIMARY KEY (titolo);
 <   ALTER TABLE ONLY public.libro DROP CONSTRAINT "Libri_pkey";
       public            postgres    false    211            ?           2606    16401    utente Utente_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.utente
    ADD CONSTRAINT "Utente_pkey" PRIMARY KEY (username);
 >   ALTER TABLE ONLY public.utente DROP CONSTRAINT "Utente_pkey";
       public            postgres    false    209            ?           2606    16677 .   articoli_scientifici articoli_scientifici_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.articoli_scientifici
    ADD CONSTRAINT articoli_scientifici_pkey PRIMARY KEY (titolo);
 X   ALTER TABLE ONLY public.articoli_scientifici DROP CONSTRAINT articoli_scientifici_pkey;
       public            postgres    false    216            ?           2606    16685 4   articoli_scientifici articoli_scientifici_tipo_check    CHECK CONSTRAINT     ?   ALTER TABLE public.articoli_scientifici
    ADD CONSTRAINT articoli_scientifici_tipo_check CHECK (((tipo = 'Rivista'::text) OR (tipo = 'conferenza'::text))) NOT VALID;
 Y   ALTER TABLE public.articoli_scientifici DROP CONSTRAINT articoli_scientifici_tipo_check;
       public          postgres    false    216    216            ?           2606    16500    libro check_numpag    CHECK CONSTRAINT     s   ALTER TABLE public.libro
    ADD CONSTRAINT check_numpag CHECK (((num_pag > 50) AND (num_pag <= 1000))) NOT VALID;
 7   ALTER TABLE public.libro DROP CONSTRAINT check_numpag;
       public          postgres    false    211    211            ?           2606    16684 !   articoli_scientifici check_numpag    CHECK CONSTRAINT     ?   ALTER TABLE public.articoli_scientifici
    ADD CONSTRAINT check_numpag CHECK (((num_pag > 0) AND (num_pag <= 100))) NOT VALID;
 F   ALTER TABLE public.articoli_scientifici DROP CONSTRAINT check_numpag;
       public          postgres    false    216    216            ?           2606    16514    Intervista check_pag    CHECK CONSTRAINT     s   ALTER TABLE public."Intervista"
    ADD CONSTRAINT check_pag CHECK (((num_pag > 0) AND (num_pag < 30))) NOT VALID;
 ;   ALTER TABLE public."Intervista" DROP CONSTRAINT check_pag;
       public          postgres    false    212    212            ?           2606    16451     riferimenti_bibliografici  pk_rb 
   CONSTRAINT     f   ALTER TABLE ONLY public."riferimenti_bibliografici "
    ADD CONSTRAINT pk_rb PRIMARY KEY ("Titolo");
 L   ALTER TABLE ONLY public."riferimenti_bibliografici " DROP CONSTRAINT pk_rb;
       public            postgres    false    210            ?           1259    16683    fk    INDEX     E   CREATE INDEX fk ON public.articoli_scientifici USING btree (titolo);
    DROP INDEX public.fk;
       public            postgres    false    216            ?           1259    16457    fk_rb    INDEX     R   CREATE INDEX fk_rb ON public."riferimenti_bibliografici " USING btree ("Utente");
    DROP INDEX public.fk_rb;
       public            postgres    false    210            ?           1259    16531    fkcita    INDEX     G   CREATE INDEX fkcita ON public."Citazione" USING btree ("Titolo-Cita");
    DROP INDEX public.fkcita;
       public            postgres    false    213            ?           1259    16537    fkcitato    INDEX     K   CREATE INDEX fkcitato ON public."Citazione" USING btree ("Titolo_Citato");
    DROP INDEX public.fkcitato;
       public            postgres    false    213            ?           1259    16506    fki_fk    INDEX     :   CREATE INDEX fki_fk ON public.libro USING btree (titolo);
    DROP INDEX public.fki_fk;
       public            postgres    false    211            ?           2620    16659    accessi currentdate    TRIGGER     o   CREATE TRIGGER currentdate BEFORE INSERT ON public.accessi FOR EACH ROW EXECUTE FUNCTION public.currentdate();
 ,   DROP TRIGGER currentdate ON public.accessi;
       public          postgres    false    215    219            ?           2606    16759 +   Appartiene Appartiene_titolo-categoria_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Appartiene"
    ADD CONSTRAINT "Appartiene_titolo-categoria_fkey" FOREIGN KEY ("titolo-categoria") REFERENCES public."Categoria"(nome_categoria) NOT VALID;
 Y   ALTER TABLE ONLY public."Appartiene" DROP CONSTRAINT "Appartiene_titolo-categoria_fkey";
       public          postgres    false    3221    217    218            ?           2606    16754 -   Appartiene Appartiene_titolo-riferimento_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Appartiene"
    ADD CONSTRAINT "Appartiene_titolo-riferimento_fkey" FOREIGN KEY ("titolo-riferimento") REFERENCES public."riferimenti_bibliografici "("Titolo") NOT VALID;
 [   ALTER TABLE ONLY public."Appartiene" DROP CONSTRAINT "Appartiene_titolo-riferimento_fkey";
       public          postgres    false    210    3209    218            ?           2606    16742    Categoria Categoria_Utente_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Categoria"
    ADD CONSTRAINT "Categoria_Utente_fkey" FOREIGN KEY ("Utente") REFERENCES public.utente(username) NOT VALID;
 M   ALTER TABLE ONLY public."Categoria" DROP CONSTRAINT "Categoria_Utente_fkey";
       public          postgres    false    217    3206    209            ?           2606    16501    libro fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.libro
    ADD CONSTRAINT fk FOREIGN KEY (titolo) REFERENCES public."riferimenti_bibliografici "("Titolo") NOT VALID;
 2   ALTER TABLE ONLY public.libro DROP CONSTRAINT fk;
       public          postgres    false    210    211    3209            ?           2606    16515    Intervista fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Intervista"
    ADD CONSTRAINT fk FOREIGN KEY ("Titolo") REFERENCES public."riferimenti_bibliografici "("Titolo") NOT VALID;
 9   ALTER TABLE ONLY public."Intervista" DROP CONSTRAINT fk;
       public          postgres    false    212    3209    210            ?           2606    16678    articoli_scientifici fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.articoli_scientifici
    ADD CONSTRAINT fk FOREIGN KEY (titolo) REFERENCES public."riferimenti_bibliografici "("Titolo") NOT VALID;
 A   ALTER TABLE ONLY public.articoli_scientifici DROP CONSTRAINT fk;
       public          postgres    false    210    3209    216            ?           2606    16551 
   Scrive fk1    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Scrive"
    ADD CONSTRAINT fk1 FOREIGN KEY ("Titolo") REFERENCES public."riferimenti_bibliografici "("Titolo") NOT VALID;
 6   ALTER TABLE ONLY public."Scrive" DROP CONSTRAINT fk1;
       public          postgres    false    3209    210    214            ?           2606    16452     riferimenti_bibliografici  fk_rb    FK CONSTRAINT     ?   ALTER TABLE ONLY public."riferimenti_bibliografici "
    ADD CONSTRAINT fk_rb FOREIGN KEY ("Utente") REFERENCES public.utente(username) NOT VALID;
 L   ALTER TABLE ONLY public."riferimenti_bibliografici " DROP CONSTRAINT fk_rb;
       public          postgres    false    210    209    3206            ?           2606    16526    Citazione fkcita    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Citazione"
    ADD CONSTRAINT fkcita FOREIGN KEY ("Titolo-Cita") REFERENCES public."riferimenti_bibliografici "("Titolo") NOT VALID;
 <   ALTER TABLE ONLY public."Citazione" DROP CONSTRAINT fkcita;
       public          postgres    false    210    213    3209            ?           2606    16532    Citazione fkcitato    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Citazione"
    ADD CONSTRAINT fkcitato FOREIGN KEY ("Titolo_Citato") REFERENCES public."riferimenti_bibliografici "("Titolo") NOT VALID;
 >   ALTER TABLE ONLY public."Citazione" DROP CONSTRAINT fkcitato;
       public          postgres    false    213    3209    210            5      x?????? ? ?      4   ,   x?K?KO?I?LN,IM?/?L4??JD22?2Ƣʈ+F??? ?      0   +   x?KMMMMIIMᬪ??*?,???7???0?1:?&???? ?Z      /   '   x?32???+I-*?,.I?2??a??aep??qqq ??<      1   ?   x????n?0???{?IK?8??ױ,{1?l??????v>???GD F\??y3`F???pt4dbV-p?z?J?K?.l?&?c????ڐ?'???	?w??_?? ?{??S)j)?g?_Po?V?bt??????????x$gR??T??k?w??+?m???m???mq@C^??j????f8ߪ??\??O??q??<?9-c?4??.5?|O?s????yE?o,纈      2   .	  x?uZK?\9\O??hAIQ̳?ƋB?@?????'??? N
?U??>?E???_|~???s????ѿ????v?????{??Ϯmوuĳ?&>u???????w???M?o]?w??x۾eZ?}=???w???8_?l{?????C??????
?9??tlR?0?S?u?!??]????-?z???I?=Ջx?6???e?]????%?wݴ???߿c??x/l????5?s???????_??@??s?ϱ???7?h?J?E?avA???D|?m????????/}?k???mn8?=f??mF_?????R#d?ז??v?O??Oj?:[??(׀Ս?5l`??xn??@??[??Vy?>M:??F?t?6??q?)1?:ї_??Q????\?^?it+SY???E?CE[?b?<?ިh?ch??wخc?gx??f7???KS,2.?Pd??????u??R[?rY?c?Sn?7Encϭ?5???k??k͹?r?U?1A?pľ?$?.??c8?8}????Y??B????ó??f;.u???}0
?Ĉ^Z?e???u?{2"?dhXƉ?????b?R,?c?:H???*???fp?b?"?c?	J?=?qPE???`?m,\?DlzE?!?c?FO??H??o@X???K?!???Db1H?bEy?͢??^u?n&>?8?X???,???{???L??t??o7%?G,????5??RkVڃ?????uJ?1WԄy[G??ԁ?}?ȥ???-"??8E?s???Zc?l贺I帙???R??L?	T?U??65?Lݽ\c?D???E?GDRҲ????rl??	u???G[Zz??U???5???3?,k)A?K?@0?Q_ƶ?a?????Ƣ?? Z)}?2?? %???6y(+3?'?1,&?̚?q?? ?,)?? &3?g}??A=?8g!?X?]?t=_?O?d(?%"3?`m(B=???8t\R?#huA?Т?D??@9??1?Xl,?_???ޟL(????Y????dM/?σ0??9+??t?0?5 ???W?Bz?P#!캆?]p???B?'.???B????D???$B??6d"??*Ӏ??w?%²?>?????w??it??VԗD??l?¼-??D????t?8?rW? 7A??ҽ(?ɀ ???z???? RN????#Y?V?t0i?,kAU?????~?U?eQ6???}??p???U???ca?1S#u???r???B?u?????W?zB????y?_???hRK???? 4Cb?fKi??? ???(ƅg??f??G?L*=?sְ?j????-?[nke'ZI)?1^?վfm0IrOG9.t?A,?}7?S9????U?W"?d?֩???B??n?`E_?"?"?&????|??E?٣?'?
?y???L?"?4??wy?D(
c???Ds4?ŀ? r???ؔ?w???Y?B"P?8??8???96A???ڤN????G-G"?};??Z??~?O`?q9?? T9??B?@VҎ?Pg?????ǳ??$?????]?&.g>???:?E36??q???? ??4?AC\-?29Oi?U?&N_? ά?n$Z?$??^?D??(8?z??A??F?wA$??滐a?R(@??\vѴ:??*b0????`?"?U????}k9c??N`?"??)m?Y0m"NJ???9?A?yM?M??A?G9?b??Ḽ$e??C)O??
}???b??b??"??(P??D?&?W1 ???Z?M?????AE_| Ak?~[??]?ՖwUZ?@?V?? ?????D? ط??g???@? Wh????q?6?????Hw-f??`ǉ]???-??7t#za?C??yEt}??c???g?{??)?B?_J?:??>nR???X??????fw`څ:W???PP????3??mt???w?????:>??3???P|????q'?????Cm???W08?E??? rj?иd䙺-?=???????? eG?	g????|[!ؐ؂?(??i??Z!?X?M?wG??????????be??-?????s??]8??[
"^????X6r???|??U=?z?"Yh??"<umN?W???xRuQ??yR?R?????w):?/?Q?bL? ?}?;???????^Lq^???(??诎?1????p?1lx?~bg?> ????_??hYt?]?扰??N??xw:ڌ??j?v??+???Q??????= ????????~.:/?=?c?9g+yA?ы??????-f?? ???&n?????x??=??e??      3   0   x?36?L,?L???7?L??KK-JͫJ???@??2?2?K?b???? ??/      .   ?   x?U??? E???,????^4EFↀ?f_?R??>??^{?c?}????C?hz???V?_? U?Y??XVF,??DY?$.???U3?y?Ŗ?%??3[?D~?X $?zeI?S?9W??`?fG?m>?????beMiJ,?j?V?
? ????.4G?|ϧf???'???}{??֗Ŝ????? ~?iH      -   Z  x???Qn?0???)?@'l?@??HIP?z?:?R?0"?????8M????[?	?3?OYqʳ???D)?X?~wˤ}c??:?u?????D/X??N??mes?Bc?"!F????L#???!?}9k???,6A?9HbD/I%	?7{#mK??P??B?ݗA?(:k??`?m#s?mN?S??u?
??E%?r?X??@ջ1???'.???D?!??2ڔ?z?\?Q???ƞ?(??|o?D???Ab?>????(P?qoIekwн?i~/???*???nToR??\?Fŗ?<?/g5h~G?? Z?fw????????f?#_?j?I?< v]?^      ,   ?   x?MPAn? <??C??????Z???*??D??!R??flQc?큁??c??ɹ-=??/3??{??x?? M?.?vx<4???,??Z?lƨ??VۤE???Y?????߽??~4/-z?U?ɸc?!?L,+ک???Ւ?n	~?J?|.??$?E???Z??RB?Z?AIr?????F?z?c?3#??dk$?<?(???U)W?)?????7??????.5??     