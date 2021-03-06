package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Item;

// Task名の入力確認 , Taskの重複チェック
public class TaskValidator {
    //エラーリストの取得
    public static List<String> validate(Item i, Boolean task_duplicate_check_flag) {
        List<String> errors = new ArrayList<String>();

     // Taskのエラーチェック
        String task_error = _validateTask(i.getTask(), task_duplicate_check_flag);
        if(!task_error.equals("")) {
            errors.add(task_error);
        }

        return errors;
    }


    // Taskの入力チェックと処理、Taskの重複チェックと処理
    private static String _validateTask(String task, Boolean task_duplicate_check_flag) {
        // 必須入力チェック
        if(task == null || task.equals("")) {
            return "Task名を追加してください!!";
        }

        // *ダブりチェックにてエラーが発生* 一旦省く

        // ダブった場合　情報を出力
        // if(task_duplicate_check_flag) {
        //     EntityManager em = DBUtil.createEntityManager();
        //     String items_count = (String)em.createNamedQuery("checkRegisteredTask, String.class")
        //             .setParameter("task", task)
        //             .getSingleResult();
        //
        //     em.close();
        //     if(items_count.equals("task_error")) {
        //         return "そのTask名は、既に存在しております。";
        //     }
        // }

        return "";
    }

}
