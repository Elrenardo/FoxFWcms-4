<?php
/*--------
By      : Teysseire Guillaume
Date    : 30/10/2015
Update  : 03/11/2015
Licence : © Copyright
Version : 1.1
-------------------------
*/
class Controller_carousel
{
	//--------------------------------------------------------------------------------
	//--------------------------------------------------------------------------------
	//
	//
	//
	//--------------------------------------------------------------------------------
	public function __construct() 
    {
    	$path = Controller_carousel::getPathCarousel();
    	if( !is_dir( $path ))
    		mkdir('web/carousel', 0777, true );
    }

    //--------------------------------------------------------------------------------
	//--------------------------------------------------------------------------------
	//
	//
	//
	//--------------------------------------------------------------------------------
	public static function getPathCarousel()
	{
		return _WEB.'carousel';
	}

   	//--------------------------------------------------------------------------------
	//--------------------------------------------------------------------------------
	//
	//
	//
	//--------------------------------------------------------------------------------
	static public function viewPanelAdmin()
	{
		$ret = array(
			'titre'  => 'Carousel',
			'router' => 'carousel_gestion',
			'panel'  => FoxFWKernel::getView('carousel_panelAdmin')
		);
		return $ret;
	}

    //--------------------------------------------------------------------------------
	//--------------------------------------------------------------------------------
	//
	//
	//
	//--------------------------------------------------------------------------------
	public function view( $params )
	{
		$path = Controller_carousel::getPathCarousel();
		//lister le repertoire pour avoir les images
		$files = scandir( $path );

		return $GLOBALS['Twig']->render( FoxFWKernel::getView('carousel_view'), array('img'=>$files));
	}


	//--------------------------------------------------------------------------------
	//--------------------------------------------------------------------------------
	//
	//
	//
	//--------------------------------------------------------------------------------
	public function edit( $params )
	{
		$path = Controller_carousel::getPathCarousel().'/';

		return $GLOBALS['Twig']->render( FoxFWKernel::getView('carousel_edit'), array('path'=>$path));
	}

	//--------------------------------------------------------------------------------
	//--------------------------------------------------------------------------------
	//
	//
	//
	//--------------------------------------------------------------------------------
	public function add( $params )
	{
		$path = Controller_carousel::getPathCarousel();

		//Ajout des documents de upload_files
		FoxFWKernel::addController('Upload_files');
		Upload_files::deplacer( $path );

		FoxFWKernel::loadRouter('carousel_gestion');
	}
};