# $NetBSD: Makefile,v 1.3 2017/11/30 16:45:33 adam Exp $

PKGREVISION= 2
.include "../../net/freeradius/Makefile.module"

PKGNAME=		${DISTNAME:S/-server/-sqlite3/}
COMMENT=		Free RADIUS SQLite support
CATEGORIES=		net

CONFIGURE_ARGS+=    --with-rlm_sql_iodbc

do-install:
	${INSTALL_LIB} ${WRKSRC}/build/lib/.libs/rlm_sql_sqlite.so ${DESTDIR}${PREFIX}/lib

.include "../../databases/sqlite3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
