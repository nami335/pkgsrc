# $NetBSD: Makefile,v 1.21 2018/01/28 20:10:44 wiz Exp $

DISTNAME=	hexchat-2.12.3
PKGREVISION=	6
CATEGORIES=	chat
MASTER_SITES=	http://dl.hexchat.net/hexchat/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://hexchat.github.io/
COMMENT=	IRC client based on XChat
LICENSE=	gnu-gpl-v2 AND gnu-lgpl-v2.1 AND mit

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	bison gmake intltool msgfmt msgmerge pkg-config xgettext
USE_LANGUAGES=	c c++

PKGCONFIG_OVERRIDE+=	share/pkgconfig/hexchat-plugin.pc.in

.include "options.mk"

CONFIGURE_ARGS+=	--enable-textfe

.if ${OPSYS} == "Darwin"
CONFIGURE_ARGS+=	--disable-xlib
.else
.include "../../x11/libX11/buildlink3.mk"
.endif

.if ${MACHINE_ARCH} == "i386"
CONFIGURE_ARGS+=	--enable-mmx
.endif

.include "../../textproc/iso-codes/buildlink3.mk"
.include "../../devel/pango/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
