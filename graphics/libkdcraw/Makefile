# $NetBSD: Makefile,v 1.61 2018/01/01 21:18:08 adam Exp $

DISTNAME=	libkdcraw-15.08.3
PKGREVISION=	6
CATEGORIES=	graphics
COMMENT=	KDE digital camera raw image library wrapper
MASTER_SITES=	${MASTER_SITE_KDE:=applications/15.08.3/src/}

.include "../../meta-pkgs/kde4/Makefile.kde4"

PKGCONFIG_OVERRIDE+=    libkdcraw.pc.cmake

.include "../../meta-pkgs/kde4/kde4.mk"

.include "../../graphics/libraw/buildlink3.mk"
.include "../../x11/kdelibs4/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
