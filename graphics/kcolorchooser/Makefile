# $NetBSD: Makefile,v 1.35 2018/01/01 21:18:32 adam Exp $

DISTNAME=	kcolorchooser-15.12.0
PKGREVISION=	6
CATEGORIES=	graphics
COMMENT=	KDE color chooser
MASTER_SITES=	${MASTER_SITE_KDE:=applications/15.12.0/src/}

.include "../../meta-pkgs/kde4/Makefile.kde4"

.include "../../meta-pkgs/kde4/kde4.mk"

.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/kdelibs4/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
