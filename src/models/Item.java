package models;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "items")
@NamedQueries({
    @NamedQuery( // 全てのTask項目を取得
            name = "getAllItems",
            query = "SELECT i FROM Item AS i ORDER BY i.id DESC"
            ),
    @NamedQuery( // Task項目の全件数を取得
            name = "getItemsCount",
            query = "SELECT COUNT(i) FROM Item AS i"
            ),
    @NamedQuery( // 同名のTaskがデータベースに存在しているかチェック
            name = "checkRegisteredTask",
            query = "SELECT COUNT(i) FROM Item AS i WHERE i.task = :task"
            )
})
@Entity
public class Item {
    // Id 主キー 数値型
    @Id
    @Column(name = "id")
    // 主キーを生み出す
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    // task 参照型 一意制約
    @Column(name = "task",nullable = false, unique = true)
    private String task;

    // action String
    @Column(name = "action")
    private String action;

    // item string
    @Column(name = "item")
    private String item;

    // importance Integer
    @Column(name = "importance")
    private Integer importance;

    // period　日付型
    @Column(name = "period")
    private Date period;

    // content 備考欄
    @Column(name = "content")
    private String content;

    // 作成日
    @Column(name = "created_at", nullable = false)
    private Timestamp created_at;

    // 更新日
    @Column(name = "updated_at", nullable = false)
    private Timestamp updated_at;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public Integer getImportance() {
        return importance;
    }

    public void setImportance(Integer importance) {
        this.importance = importance;
    }

    public Date getPeriod() {
        return period;
    }

    public void setPeriod(Date period) {
        this.period = period;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

}
