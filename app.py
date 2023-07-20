#importacion del framework
from flask import Flask,render_template,request,redirect,url_for,flash
from flask_mysqldb import MySQL

#Inicializacion del APP
app = Flask (__name__)
app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']=''
app.config['MYSQL_DB']='Softsit_pii'
app.secret_key= 'mysecrety'
mysql= MySQL(app)

#Declaracion de ruta http://localhost:5000
@app.route('/')
def index():
  CC= mysql.connection.cursor()
  CC.execute('select * from pefundas')
  conpefundas= CC.fetchall()
  print(conpefundas)
  return render_template('index.html',listpefundas= conpefundas)

#rura http:localhost:5000/guardar tipo POST para insert
@app.route('/guardar',methods=['POST'])
def guardar(): 
  if request.method == 'POST':

    # pasamos a variables el contenido de los input
    VNombre=request.form['txtNombre']
    VApe_p=request.form['txtApe_p']
    VApe_m=request.form['txtApe_m']
    VMunicipio=request.form['txtMunicipio']
    VEstado=request.form['txtEstado']
    VColonia=request.form['txtColonia']
    VCalle=request.form['txtCalle']
    VDireccion=request.form['txtDireccion']

    #Conectar y ejecutar el insert
    cs= mysql.connection.cursor()
    cs.execute('insert into pefundas (Nombre,Ape_p,Ape_m,Municipio,Estado, Colonia, Calle, Direccion) values(%s,%s,%s,%s,%s,%s,%s,%s)',(VNombre,VApe_p,VApe_m,VMunicipio,VEstado,VColonia,VCalle,VDireccion))
    mysql.connection.commit()

  flash('El album fue agregado correctamente')
  return redirect(url_for('index'))

#Ejecucion del servidor en el puerto 5000
if __name__ == '__main__':
  app.run(port=5000,debug=True)
