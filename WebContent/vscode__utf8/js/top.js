function init(){

    /******************  ��� �����  *******************/
    
    let modaltrigger = false;
    const userCheckBox = document.querySelector('#userPopup');
    const modalWindow = document.getElementById('modalDiv');
    const modalInnerFrame = document.getElementById('modalInnerFrame');
    const modal_elements_wrapper = document.getElementById('modal_elements_wrapper');
    const login_form = document.getElementById('login_form');

    /** ���â ���� ���� ��� **/

    modalInnerFrame.style.width = "0px";
    modalInnerFrame.style.height = "0px";
    userCheckBox.addEventListener('change', function(){
        if(!modaltrigger){
            modaltrigger = true;
            // console.log(modaltrigger);
            modalWindow.style.display = "block";
            modalWindow.style.opacity = "1";
            setTimeout(function(){
                modalInnerFrame.style.width = "400px";
                modalInnerFrame.style.height = "500px";
            }, 80);

            setTimeout(function(){
                modal_elements_wrapper.style.opacity="1";
                modal_elements_wrapper.style.transition="opacity 0.3s";
                
            }, 500);
            
            // setTimeout(function(){
                //     login_form.style.display = "flex";
                // }, 600);
                
            }
        else{
            modaltrigger = false;
            // console.log(modaltrigger);
            
            modalWindow.style.opacity = "0";
            modal_elements_wrapper.style.opacity="0";
            modalWindow.style.transition = "opacity 0.3s";
            setTimeout(function(){
                modalWindow.style.display = "none";
            }, 400);

            modalInnerFrame.style.width = "0px";
            modalInnerFrame.style.height = "0px";
            // modal_elements_wrapper.style.opacity="0";
            // modal_elements_wrapper.style.transition="opacity 0.3s";
        }
    });

    /** �α��� id, pwd  input �±� event **/
    // const login_input = document.querySelectorAll('.login_input');
    
    // [].forEach.call(login_input, function(inp){
    //    inp.addEventListener('focus', function(){
    //        console.log('hi');
    //    })
    //     }
    // )
};

  init();