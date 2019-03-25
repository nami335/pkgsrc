#	$NetBSD: bsd.hostprog.mk,v 1.1.1.1 2006/07/14 23:13:00 jlam Exp $
#	@(#)bsd.prog.mk	8.2 (Berkeley) 4/2/94

.if !target(__initialized__)
__initialized__:
.if exists(${.CURDIR}/../Makefile.inc)
.include "${.CURDIR}/../Makefile.inc"
.endif
.include <bsd.own.mk>
.include <bsd.obj.mk>
.include <bsd.depall.mk>
.MAIN:		all
.endif

.PHONY:		cleanprog 
clean cleandir: cleanprog

CFLAGS+=	${COPTS}

LIBBZ2?=	${PREFIX}/lib/libbz2.a
LIBC?=		${PREFIX}/lib/libc.a
LIBC_PIC?=	${PREFIX}/lib/libc_pic.a
LIBCDK?=	${PREFIX}/lib/libcdk.a
LIBCOMPAT?=	${PREFIX}/lib/libcompat.a
LIBCRYPT?=	${PREFIX}/lib/libcrypt.a
LIBCURSES?=	${PREFIX}/lib/libcurses.a
LIBDBM?=	${PREFIX}/lib/libdbm.a
LIBDES?=	${PREFIX}/lib/libdes.a
LIBEDIT?=	${PREFIX}/lib/libedit.a
LIBFORM?=	${PREFIX}/lib/libform.a
LIBGCC?=	${PREFIX}/lib/libgcc.a
LIBGNUMALLOC?=	${PREFIX}/lib/libgnumalloc.a
LIBINTL?=	${PREFIX}/lib/libintl.a
LIBIPSEC?=	${PREFIX}/lib/libipsec.a
LIBKDB?=	${PREFIX}/lib/libkdb.a
LIBKRB?=	${PREFIX}/lib/libkrb.a
LIBKVM?=	${PREFIX}/lib/libkvm.a
LIBL?=		${PREFIX}/lib/libl.a
LIBM?=		${PREFIX}/lib/libm.a
LIBMENU?=	${PREFIX}/lib/libmenu.a
LIBMP?=		${PREFIX}/lib/libmp.a
LIBNTP?=	${PREFIX}/lib/libntp.a
LIBOBJC?=	${PREFIX}/lib/libobjc.a
LIBPC?=		${PREFIX}/lib/libpc.a
LIBPCAP?=	${PREFIX}/lib/libpcap.a
LIBPLOT?=	${PREFIX}/lib/libplot.a
LIBPOSIX?=	${PREFIX}/lib/libposix.a
LIBRESOLV?=	${PREFIX}/lib/libresolv.a
LIBRPCSVC?=	${PREFIX}/lib/librpcsvc.a
LIBSKEY?=	${PREFIX}/lib/libskey.a
LIBTERMCAP?=	${PREFIX}/lib/libtermcap.a
LIBTELNET?=	${PREFIX}/lib/libtelnet.a
LIBUTIL?=	${PREFIX}/lib/libutil.a
LIBWRAP?=	${PREFIX}/lib/libwrap.a
LIBY?=		${PREFIX}/lib/liby.a
LIBZ?=		${PREFIX}/lib/libz.a

.if defined(SHAREDSTRINGS)
CLEANFILES+=strings
.c.lo:
	${HOST_CC} -E ${CFLAGS} ${.IMPSRC} | xstr -c -
	@${HOST_CC} ${CFLAGS} -c x.c -o ${.TARGET}
	@rm -f x.c

.cc.lo:
	${HOST_CXX} -E ${CXXFLAGS} ${.IMPSRC} | xstr -c -
	@mv -f x.c x.cc
	@${HOST_CXX} ${CXXFLAGS} -c x.cc -o ${.TARGET}
	@rm -f x.cc

.C.lo:
	${HOST_CXX} -E ${CXXFLAGS} ${.IMPSRC} | xstr -c -
	@mv -f x.c x.C
	@${HOST_CXX} ${CXXFLAGS} -c x.C -o ${.TARGET}
	@rm -f x.C
.endif


.if defined(HOSTPROG)
SRCS?=		${HOSTPROG}.c

DPSRCS+=	${SRCS:M*.l:.l=.c} ${SRCS:M*.y:.y=.c}
CLEANFILES+=	${DPSRCS}
.if defined(YHEADER)
CLEANFILES+=	${SRCS:M*.y:.y=.h}
.endif

.if !empty(SRCS:N*.h:N*.sh)
OBJS+=		${SRCS:N*.h:N*.sh:R:S/$/.lo/g}
LOBJS+=		${LSRCS:.c=.ln} ${SRCS:M*.c:.c=.ln}
.endif

.if defined(OBJS) && !empty(OBJS)
.NOPATH: ${OBJS}

${HOSTPROG}: ${DPSRCS} ${OBJS} ${LIBC} ${DPADD}
	${HOST_LINK.c} ${HOST_LDSTATIC} -o ${.TARGET} ${OBJS} ${LDADD}

.endif	# defined(OBJS) && !empty(OBJS)

.if !defined(MAN)
MAN=	${HOSTPROG}.1
.endif	# !defined(MAN)
.endif	# defined(HOSTPROG)

realall: ${HOSTPROG}

cleanprog:
	rm -f a.out [Ee]rrs mklog core *.core \
	    ${HOSTPROG} ${OBJS} ${LOBJS} ${CLEANFILES}

beforedepend:
CPPFLAGS=	${HOST_CPPFLAGS}

.if defined(SRCS)
afterdepend: .depend
	@(TMP=${PREFIX}/tmp/_depend$$$$; \
	    sed -e 's/^\([^\.]*\).o[ ]*:/\1.lo \1.ln:/' \
	      < .depend > $$TMP; \
	    mv $$TMP .depend)
.endif

lint: ${LOBJS}
.if defined(LOBJS) && !empty(LOBJS)
	${LINT} ${LINTFLAGS} ${LDFLAGS:M-L*} ${LOBJS} ${LDADD}
.endif

.include <bsd.man.mk>
.include <bsd.nls.mk>
.include <bsd.files.mk>
.include <bsd.inc.mk>
.include <bsd.links.mk>
.include <bsd.dep.mk>
.include <bsd.sys.mk>

# Make sure all of the standard targets are defined, even if they do nothing.
regress:
