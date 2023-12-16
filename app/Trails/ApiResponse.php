<?php
namespace App\Trails;
trait ApiResponse
{
	function success_ressponse($result,$code=200,$message="Successful"){
		return response()->json(data:[
			"status"=>true,
			"code"=>$code,
			"message"=>__($message),
			"data"=>$result
			]
			,status:$code);
	}
	function failed_ressponse($result=null,$code=404,$message="Failed"){
		return response()->json(data:[
			"status"=>false,
			"code"=>$code,
			"message"=>__($message),
			"data"=>$result
			]
			,status:$code);
	}
}
?>