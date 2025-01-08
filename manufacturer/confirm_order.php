<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
require("../includes/config.php");
session_start();

if (isset($_SESSION['manufacturer_login'])) {
    $id = $_GET['id'];

    if (!isset($id)) {
        header("Location: view_orders.php");
        exit;
    }

    // Fetch order and available quantities
    $query = "
        SELECT 
            products.pro_id AS pro_id, 
            products.quantity AS avail_quantity, 
            order_items.quantity AS order_quantity 
        FROM order_items 
        JOIN products ON products.pro_id = order_items.pro_id 
        WHERE order_items.order_id = ?";
    
    $stmt = $con->prepare($query);
    $stmt->bind_param("s", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    $updateSuccess = true;

    while ($row = $result->fetch_assoc()) {
        $proId = $row['pro_id'];
        $availQuantity = $row['avail_quantity'];
        $orderQuantity = $row['order_quantity'];

        $total = $availQuantity - $orderQuantity;

        if ($total >= 0) {
            $updateQuery = "UPDATE products SET quantity = ? WHERE pro_id = ?";
            $updateStmt = $con->prepare($updateQuery);
            $updateStmt->bind_param("is", $total, $proId);
            if (!$updateStmt->execute()) {
                $updateSuccess = false;
            }
        } else {
            $updateSuccess = false;
        }
    }

    if (!$updateSuccess) {
        echo "<script>alert('You do not have enough stock to approve this order.');</script>";
        header("refresh:0;url=view_orders.php");
        exit;
    }

    // Approve the order
    $confirmQuery = "UPDATE orders SET approved = 1 WHERE order_id = ?";
    $confirmStmt = $con->prepare($confirmQuery);
    $confirmStmt->bind_param("s", $id);

    if ($confirmStmt->execute()) {
        echo "<script>alert('Order has been confirmed.');</script>";
    } else {
        echo "<script>alert('There was an issue approving the order.');</script>";
    }

    header("refresh:0;url=view_orders.php");
    exit;
} else {
    header("Location: ../index.php");
    exit;
}
?>