.class public Lcom/fkzhang/wechatforwarder/d/h;
.super Ljava/lang/Object;


# instance fields
.field private a:Ljava/util/HashMap;

.field private b:Landroid/content/Context;

.field private c:[Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_ID"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "ACCOUNT"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "USERNAME"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "NICKNAME"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "TYPE"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/fkzhang/wechatforwarder/d/h;->c:[Ljava/lang/String;

    const-string v0, "ACCOUNT = ? AND USERNAME = ?"

    iput-object v0, p0, Lcom/fkzhang/wechatforwarder/d/h;->d:Ljava/lang/String;

    iput-object p1, p0, Lcom/fkzhang/wechatforwarder/d/h;->b:Landroid/content/Context;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/fkzhang/wechatforwarder/d/h;->a:Ljava/util/HashMap;

    const-string v0, ""

    iput-object v0, p0, Lcom/fkzhang/wechatforwarder/d/h;->e:Ljava/lang/String;

    iput-object p2, p0, Lcom/fkzhang/wechatforwarder/d/h;->f:Landroid/net/Uri;

    return-void
.end method

.method private a(Ljava/lang/Integer;)V
    .locals 6

    iget-object v0, p0, Lcom/fkzhang/wechatforwarder/d/h;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/fkzhang/wechatforwarder/d/h;->f:Landroid/net/Uri;

    const-string v2, "ACCOUNT=? AND _ID=?"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/fkzhang/wechatforwarder/d/h;->e:Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method private b()Landroid/database/Cursor;
    .locals 7

    iget-object v0, p0, Lcom/fkzhang/wechatforwarder/d/h;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/fkzhang/wechatforwarder/d/h;->f:Landroid/net/Uri;

    iget-object v2, p0, Lcom/fkzhang/wechatforwarder/d/h;->c:[Ljava/lang/String;

    const-string v3, "ACCOUNT = ? AND TYPE != 0 AND (TYPE &1 !=0 OR USERNAME LIKE \'%@chatroom\')"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/fkzhang/wechatforwarder/d/h;->e:Ljava/lang/String;

    aput-object v6, v4, v5

    const-string v5, "NICKNAME"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method private b(Landroid/database/Cursor;)Ljava/util/ArrayList;
    .locals 5

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    if-nez p1, :cond_0

    move-object v0, v1

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_2

    :cond_1
    invoke-virtual {p0, p1}, Lcom/fkzhang/wechatforwarder/d/h;->a(Landroid/database/Cursor;)Lcom/fkzhang/wechatforwarder/d/g;

    move-result-object v3

    invoke-virtual {v3}, Lcom/fkzhang/wechatforwarder/d/g;->a()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string v4, "_ID"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    invoke-virtual {v3}, Lcom/fkzhang/wechatforwarder/d/g;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_1

    :cond_2
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-direct {p0, v0}, Lcom/fkzhang/wechatforwarder/d/h;->a(Ljava/lang/Integer;)V

    goto :goto_2

    :cond_3
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    move-object v0, v1

    goto :goto_0
.end method


# virtual methods
.method protected a(Landroid/database/Cursor;)Lcom/fkzhang/wechatforwarder/d/g;
    .locals 5

    const-string v0, "ACCOUNT"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "USERNAME"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "NICKNAME"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "TYPE"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    new-instance v4, Lcom/fkzhang/wechatforwarder/d/g;

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/fkzhang/wechatforwarder/d/g;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v4
.end method

.method public a()Ljava/util/ArrayList;
    .locals 1

    invoke-direct {p0}, Lcom/fkzhang/wechatforwarder/d/h;->b()Landroid/database/Cursor;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/fkzhang/wechatforwarder/d/h;->b(Landroid/database/Cursor;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/fkzhang/wechatforwarder/d/h;->e:Ljava/lang/String;

    return-void
.end method
