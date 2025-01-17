<?php
class LoginController extends AppController {

	public $requireLogin = false;
	public $uses =  array('User');

	public function index() {
		if(CakeSession::check('User.login')) {
            $this->redirect("/");
		}
		$this->set('title_for_layout', __("Login"));
		$this->layout = 'front';
		if($this->request->is('post')) {
			$pass = $this->request->data('pass');
			$login= $this->request->data('login');
			$remember = $this->request->data('remember');
			if(strlen($pass) > 0 && strlen($login) > 0 ) {
				if(!$this->Auth->login($login, md5($pass), $remember)) {
					//Show error
					$this->Flash->error(__('It appears that you typed in the wrong username/e-mail or password mate, please try again'));
				} else {
					//login Ok, redirect
                    $this->redirect("/");
				}
			}
		}
	}
}
