from fastapi import APIRouter

from api.routes import document

api_router = APIRouter()
api_router.include_router(document.router, prefix="/document", tags=["document"])
# api_router.include_router(attributes.router, prefix="/attributes", tags=["attributes"])
# api_router.include_router(outfits.router, prefix="/outfits", tags=["outfits"])
# api_router.include_router(categorires.router, prefix="/categories", tags=["categories"])
# api_router.include_router(rulebase.router, prefix="/rulebase", tags=["rulebase"])
# api_router.include_router(try_on.router,prefix="/try-on", tags=["try-on"])
# api_router.include_router(my_images.router,prefix="/my-images", tags=["my-images"])